require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a' , minimum: 4
    asser_select '#main .entry', 3
    asser_select 'h3', 'Programming Ruby 1.9'
    asser_select '.price', /\$[,\d]+\.\d\d/
  end

end
