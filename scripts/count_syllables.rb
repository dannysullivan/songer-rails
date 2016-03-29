# script for processing data in tmp/syllables.txt and creating Word records

File.open(Rails.root.join('tmp', 'syllables.txt'), 'r') do |file|
  file.each_line do |line|
    word_value, syllables = line.to_s.split('=')
    syllable_count = syllables.split('-').length
    Word.create(value: word_value, syllables: syllable_count)
  end
end
