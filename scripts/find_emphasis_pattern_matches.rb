matches = {}

Couplets::Line.all.each do |line1|
  line1.rhyme_group.lines.detect do |line2|
    if line1.text != line2.text && line1.emphasis_pattern == line2.emphasis_pattern
      puts line1.text
      puts line2.text
      puts "\n"
    end
  end
end

