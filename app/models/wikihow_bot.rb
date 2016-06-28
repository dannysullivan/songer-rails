class WikihowBot < TwitterBot
  def initialize
    text = File.read(Rails.root.join('config', 'sources', "wikihow.txt"))
    source = Source.new(text: text)
    @couplets = source.accidental_couplets
    self
  end

  def couplet
    @couplets.sample
  end
end
