module Couplets; end

class Couplets::Source
  include ActiveModel::Model
  attr_accessor :text

  def sentences
    return @sentences if @sentences

    split_text = self.text.split('.').map(&:strip)
    @sentences = split_text.map { |sentence| Couplets::Sentence.new(sentence) }
  end

  def syllable_groups
    groups = sentences.group_by(&:syllable_count).reject{ |key, _| key.nil? }
    groups.update(groups){ |key, sentences| Couplets::SyllableGroup.new(sentences) }
  end
end
