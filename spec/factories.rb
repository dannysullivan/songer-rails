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
    pattern "0..1.23."
    bass_pattern "0795"
  end

  factory :lyrics_word do
    value "test"
    syllables 1
  end
end
