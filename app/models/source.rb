class Source
  include ActiveModel::Model

  attr_accessor :text

  def accidental_couplets
    couplets = []
    rhymer = Rhymes.new
    sentences_by_length.each do |syllables, sentences|
      if syllables && syllables <= 16 && syllables >= 4
        sentences.combination(2).each do |first, second|
          begin
            first_rhymes = rhymer.rhyme(first.rhyme_word).map(&:downcase)
            sentences_rhyme = first_rhymes.include?(second.rhyme_word)
            couplets += ["#{first.text} / #{second.text}"] if sentences_rhyme
          rescue
          end
        end
      end
    end

    couplets.uniq
  end

  private

  def sentences_by_length
    sentences = text.split(/\. |\n/).map(&:presence).compact.map(&:strip)
    sentences = sentences.map{|sentence| sentence.gsub(/[^0-9a-z\s]/i, '')}
    sentences = sentences.map{|sentence| Sentence.new(text: sentence)}
    sentences.group_by(&:syllables)
  end
end
