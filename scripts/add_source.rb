# script for processing source data
source_name = ARGV[0]

File.open(Rails.root.join('config', 'sources', source_name), 'wb') do |write_file|
  File.open(Rails.root.join('config', 'sources', "#{source_name}.txt"), 'r') do |read_file|
    source = read_file.read
    source = source.downcase.gsub(/[^a-z\s]/i, '')
    source = source.split(' ').reverse.join(' ')

    markov_chain = MarkovChain.new(source)
    Marshal.dump(markov_chain, write_file)
  end
end
