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

  factory :line, class: Couplets::Line do
    text "this is some text"
    association :rhyme_group
  end

  factory :rhyme_group, class: Couplets::RhymeGroup do
    syllables 4
  end
end
