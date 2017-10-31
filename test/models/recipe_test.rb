require 'test_helper'

class RecipeTest< ActiveSupport::TestCase
   
  def setup
   
   @chef= Chef.create!(chefname:"sushma", email:"sush@gmail.com", password: "password", password_confirmation: "password")
    @recipe=@chef.recipes.build(name: "vegetables", description: "great vegetable recipe")   
  end
  
  test "recipe without chef should be invalid" do
   @recipe.chef_id = nil
   assert_not @recipe.valid?
   
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "name should be present" do
   @recipe.name= " "
   assert_not @recipe.valid?
 end
 
 test "DESCRIPTION should be present" do
   @recipe.description= " "
   assert_not @recipe.valid?
 end
 
  test "description should me more than 5 characters" do
   @recipe.description = "a" * 3
   assert_not @recipe.valid?
  end
  
  test "description should be less than 500 characters" do
   @recipe.description = "a" * 501
   assert_not @recipe.valid?
  end
 
end