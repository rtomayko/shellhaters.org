require 'rdiscount'

SUS_UTIL = "http://www.opengroup.org/onlinepubs/9699919799/utilities"

file 'cheat.frag' => ['cheat.md', 'Rakefile'] do |f|
  md = File.read('cheat.md')
  md.gsub!(/ \* (\w+)/, " * <a href='#{SUS_UTIL}/\\1.html#top'>\\1</a>")
  html = Markdown.new(md).to_html
  File.open('cheat.frag', 'wb') { |fd| fd.write(html) }
  puts 'cheat.md -> cheat.frag'
end
