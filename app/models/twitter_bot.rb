class TwitterBot
  def initialize
    @lyricist = Lyricist.from_source('dog_wiki_page')
    self
  end

  def couplet
    @lyricist.rhyming_lines_string((4..7).to_a.sample)
  end
end
