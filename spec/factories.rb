FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "example"
  end

  factory :post do
    title "Test Title"
    body "This is a fake post for testing"
  end
end
