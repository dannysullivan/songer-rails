output = {}

File.open(Rails.root.join('data', 'cmudict-0.7b.txt'), 'r').each_line do |line|
  split_line = line.split(' ')
  word = split_line.first
  phonemes = split_line.drop(1)
  pattern = ''
  phonemes.each do |phoneme|
    pattern += '-' if phoneme[-1] == '1' || phoneme[-1] == '2'
    pattern += '.' if phoneme[-1] == '0'
  end

  output[word] = pattern
end

File.open(Rails.root.join('data', 'emphasis_patterns.dat'), 'wb') do |file|
  file.write Marshal.dump(output)
end
