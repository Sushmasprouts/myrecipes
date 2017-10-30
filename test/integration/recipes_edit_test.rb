require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest
  
   def setup
     @chef=Chef.create!(chefname: "sushma", email: "sush@gmail.com")
     @recipe=Recipe.create(name:"vegetable soute", description: "great vegetable soute , add vegeatble and oil")
   end
   
   test "reject invalid recipe update" do
     get edit_recipe_path(@recipe)
     assert_template 'recipe/edit'
       patch recipes_path(@recipe), params: { recipe: {name: "", description: "some description"}}
     assert_template 'recipes/edit'
     assert_select 'h2.panel-title'
     assert_select 'div.panel-body'
   end
   
   test "succesfully edit a recipe" do
      get edit_recipe_path(@recipe)
      assert_template 'recipe/edit'
      updated_name= "updated name of the recipe"
      updated_description = "updated description"
      patch recipes_path(@recipe), params: {recipe: {name: updated_name, description: updated_description }}
      follow_redirect! 
      assert_not flash.empty?
      @recipe.reload
      assert_match updated_name.capitalize, @recipe.name
      assert_match  updated_description, @recipe.description
      
   end
   
end