require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products
  
  setup do 
    LineItem.delete_all
    Order.delete_all
    ruby_book = products(:ruby)
  end
  
  test "User goes to the store index page" do  
    get "/"
    assert_response :success
    assert_template "index"
  end
  
  test "Select product" do 
    xml_http_request :post, '/line_items' , :product_id => ruby_book.id
    assert_response :success  
    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal ruby_book, cart.line_items[0].product
  end
  
  test "Chekcout" do 
    get "/orders/new"
    assert_response :success
    assert_template "new"
  end
  
  test "User fill in the order form" do
    post_via_redirect "/orders",
      order: { name: "Dave Thomas" ,
      address: "123 The Street" ,
      email: "dave@example.com" ,
      pay_type: "Check" }
  end
  
  
  test "Depot empty the cart and process the order" do
    assert_response :success
    assert_template "index"
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size
  end
  
  
  test "Verify the order was created" do
    orders = Order.find(:all)
    assert_equal 1, orders.size
    order = orders[0]
    assert_equal "Dave Thomas" , order.name
    assert_equal "123 The Street" , order.address
    assert_equal "dave@example.com" , order.email
    assert_equal "Check" , order.pay_type
    assert_equal 1, order.line_items.size
    line_item = order.line_items[0]
    assert_equal ruby_book, line_item.product
  end
end
