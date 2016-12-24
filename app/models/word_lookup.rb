class WordLookup
  def emphasis(word)
    dictionary[word.upcase]
  end

  private

  def dictionary
    @dictionary ||= obj = Marshal.load(File.read(Rails.root.join('data', 'emphasis_patterns.dat')))
  end
end
