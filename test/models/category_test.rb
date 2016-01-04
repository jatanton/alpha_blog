require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end
  
  test "should have a valid category" do
    assert @category.valid?
  end
  
  test "should have a valid name" do
    @category.name = " "
    assert_not @category.valid?
  end
  
  test "should have a unique name" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end
  
  test "should not have a name greater than 25 characters" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end
  
  test "should not have a name less than 3 characters" do
    @category.name = "aa"
    assert_not @category.valid?
  end
  
end
