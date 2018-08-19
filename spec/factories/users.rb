require 'faker'

FactoryGirl.define do 
	factory :user do 
		email { Faker::Internet.email }
		password "foobar"
	end
end