require 'test_helper'

class RecipeDeleteTest < ActionDispatch::IntegrationTest
  def setup
     @chef=Chef.create!(chefname: "sushma", email: "sush@gmail.com", password: "password", password_confirmation: "password")
     @recipe=Recipe.create(name:"vegetable soute", description: "great vegetable soute , add vegeatble and oil")
  end
   
   test "succesfully delete recipe" do
     get recipe_path(@recipe)
     assert_template 'recipes/show'
     assert_select 'a[href=?]', recipe_path(@recipe), text:"Delete this recipe"
     assert_difference 'Recipe.count', -1 do
       delete_recipe_path(@recipe)
     end 
     assert_redirected_to recipes_path
     assert_not flash.empty?
   end
end
