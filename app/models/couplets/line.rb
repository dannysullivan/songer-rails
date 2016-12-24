module Couplets; end

class Couplets::Line < ActiveRecord::Base
  belongs_to :rhyme_group

  def emphasis_pattern
    text.split(' ').map do |word|
      word_lookup.emphasis(word.upcase)
    end.join
  end

  private

  def word_lookup
    @word_lookup ||= WordLookup.new
  end
end
