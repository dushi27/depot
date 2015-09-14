require 'unirest'

Product.delete_all
authors = 
['Isaac%20Asimov','tolkien','arthur%20conan%20doyle','Andrew%20Murray','shakespeare','j%20k%20rowling','charles%20dickens', 'leo%20tolstoy']

authors.each do |author|
  search = Unirest.get("https://openlibrary.org/search.json?q=#{author}&format=json")
  search.body['docs'].each do |book|
    begin
      isbn =  book['isbn'].first
      title = book['title']
      image = "http://covers.openlibrary.org/b/isbn/#{isbn}-L.jpg"
    rescue => e
      puts e
      next
    end
     
    product = Product.new(:title => title, :price => Faker::Commerce.price, :description => Faker::Lorem.words(4).join, :remote_image_url => image)
    product.save
    
    if product.id and product.id % 3 == 0
      cart = Cart.create  
      line_item = LineItem.create(:product_id => product.id, :cart_id => cart.id, :quantity => 1)
      order = Order.create(:name => Faker::Name.name, :street_address => Faker::Address.street_address, :city => Faker::Address.city,
        :pay_type => "Check", :zip => Faker::Address.zip, :email => Faker::Internet.email)
      line_item.order_id = order.id
      line_item.save
    end
    sleep(1)
  end
end
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create(name: 'bookzrails', password:'bookzrails2014', password_confirmation:'bookzrails2014')
User.create(name: 'john', password:'john2014', password_confirmation:'john2014')

