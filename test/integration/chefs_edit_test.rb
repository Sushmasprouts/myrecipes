require 'test_helper'

class ChefsEditTest < ActionDispatch::IntegrationTest
   
  def setup
    @chef=Chef.create!(chefname: "sruthi", email:"shru@gmail.com", password:"password", password_confirmation:"password")
  end
  
  test "reject invalid edit" do
    get edit_chef_path(@chef)
    patch chef_path(@chef), params: { chef: {chefname: " ", email: "shru@gmail.com" } }
    assert_template 'chefs/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end 
  
  test "accept valid signup" do
    get edit_chef_path(@chef)
    patch chef_path(@chef), params: { chef: {chefname: " shrthi ", email: "shru@gmail.com" } }
    assert_template 'chefs/edit'
    assert_redirected_to @chef
    assert_not flash.empty?
    @chef.reload
    assert_match "sush1", @chef.chefname
    assert_match "sush@gmail.com", @chef.email
  end 
  
end
