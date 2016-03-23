FactoryGirl.define do
  factory :song do
    rhythm1 "x..x..x."
    rhythm2 "x.x.x.x."
  end

  factory :word do
    value 'test'
    syllables 1
  end

  factory :section do
    rhythmic_pattern "x..x.xx."
  end
end
