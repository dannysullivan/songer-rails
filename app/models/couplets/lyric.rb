module Couplets; end

class Couplets::Lyric
  attr_reader :lines

  def initialize
    groups = Couplets::RhymeGroup.where(syllables: 8).sample(2)
    first_group_lines = groups.first.lines
    second_group_lines = groups.second.lines

    @lines = first_group_lines.zip(second_group_lines).flatten.compact.first(4)
  end
end
