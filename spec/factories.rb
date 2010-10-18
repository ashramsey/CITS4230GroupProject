# A factory to simulate User model objects. 
# By using the symbol ':user', we get Factory Girl to simulate the User model.
# Reference: http://thoughtbot.com/
Factory.define :user do |user|
  user.name                  "John Smith"
  user.email                 "js@someemail.com"
  user.password              "foobart"
  user.password_confirmation "foobart"
end
