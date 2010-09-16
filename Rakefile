require 'rdiscount'

SUS_UTIL = "http://www.opengroup.org/onlinepubs/9699919799/utilities"

file 'cheat.html' => ['cheat.md', 'Rakefile'] do |f|
  md = File.read('cheat.md')
  md.gsub!(/ \* (\w+)/, " * <a href='#{SUS_UTIL}/\\1.html#top'>\\1</a>")
  html = Markdown.new(md).to_html
  File.open('cheat.html', 'wb') { |fd| fd.write(html) }
end
