FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "example"
  end

  factory :song do
    rhythm1 "x..x..x."
    rhythm2 "x.x.x.x."
  end

  factory :section do
    rhythmic_pattern "x..x.xx."
  end
end
