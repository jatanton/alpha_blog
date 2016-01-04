require "test_helper"

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    #using create instead of new so it hits the db directly (ie no .save)
    @category = Category.create(name: "sports")
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should get show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end
  
  
end
