require "test_helper"

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    #using create instead of new so it hits the db directly (ie no .save)
    @category = Category.create(name: "sports")
    @user = User.create(username: "jimmy", email: "jimmy@example.com", password: "password", admin: true)
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    #simulates @user being logged in we can access the session because we are in the Controller TestCase
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end
  
  test "should get show" do
    get(:show, {'id' => @category.id})
    assert_response :success
  end
  
  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post :create, category: {name: "sports"}
    end
    assert_redirected_to categories_path
  end
  
  
end
