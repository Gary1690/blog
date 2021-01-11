require 'test_helper'

class CategoryHelper < ActiveSupport::TestCase
  
  def setup 
    @category = Category.new(name:"Sports")
  end

  test "Test should be valid" do
    assert @category.valid?
  end

  test "name should be present" do 
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do 
    @category.save
    @category2 = Category.new(name:"Sports")
    assert_not(@category2.valid?)
  end

  test "name should be max 25 characters long" do 
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name should be min 4 characters long" do 
    @category.name = "aaa"
    assert_not @category.valid?
  end

end