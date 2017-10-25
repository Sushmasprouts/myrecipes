require 'test_helper'

class ChefTest< ActiveSupport::TestCase
  
  def setup
   @chef= Chef.new(chefname: "sushma", email: "sush@ex.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chefname should be present" do
   @chef.chefname=""
   assert_not @chef.valid?
  end
  
 test "chefname should be less than 30" do
    @chef.chefname= "a" * 31
    assert_not @chef.valid?
 end
  
  test "email should be present" do
   @chef.email=""
   assert_not @chef.valid?
  end
  
  test "email should be less than 255" do
    @chef.email= "a" * 255 + "@ex.com"
    assert_not @chef.valid?
  end
 
  test " email should accept correct fromat " do
     valid_emails= %w[user@example.com SUSHMA@gmail.com sushh.kv@yahoo.ca]
     valid_emails.each do |valids|
       @chef.email = valids
       assert @chef.valid? ,"#{valids.inspect} email should be valid"
     end
  end
  
  test "should reject invalid addr" do
    invalid_emails= %w[user@example sushma@example,com sushma.name@gmail ]
    invalid_emails.each do |invalids|
      @chef.email = invalids
      assert_not @chef.valid? "#{invalids.inspect} should be invalid"
    end
  end
  
  test "email should be unique and case sensitive" do
    duplicate_chef= @chef.dup
    duplicate_chef.email=@chef.email.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end
  
  test "email should be lower case before hitting db" do
    mixed_email = "JohN@ExampLe.com"
    @chef.email = mixed_email
    @chef.save
    assert_equal mixed_email.downcase, @chef.reload.email 
  end
end