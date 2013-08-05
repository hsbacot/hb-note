Factory.define :user do |f|
	f.sequence(:email) { |n| "foo#{n}@test.com" }
	f.password "secret"
end

Factory.define :note do
  title 'Test Note'
  body 'This is an example of a body note'
  user_id 1
  public false
end