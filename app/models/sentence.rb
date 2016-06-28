class Sentence
  include ActiveModel::Model

  attr_accessor :text

  def syllables
    syllables = self.words.map{|word| SYLLABLES[word]}
    syllables.sum if syllables.compact == syllables
  end

  def rhyme_word
    self.words.last
  end

  protected

  def words
    self.text.downcase.split(' ').compact
  end
end
