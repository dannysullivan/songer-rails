FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "example"
  end

  factory :song do
    pattern "x..x..x."
  end
end
