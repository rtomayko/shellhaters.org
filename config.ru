require "showoff"
require "sinatra"
require "nokogiri"

Dir.chdir File.dirname(__FILE__)

$utils = {}
doc = Nokogiri::HTML::Document.parse(File.read('cheat.html'))
doc.search('li a').each do |node|
  $utils[node.text] = node['href']
end

class Shortcut < Sinatra::Base
  %w[/posix /cheat].each do |url|
    get url do
      content_type 'text/html', :charset => 'utf8'
      File.read('cheat.html')
    end
  end

  get '/posix/:util' do |util|
    if url = $utils[util]
      redirect url
    else
      content_type 'text/plan', :charset => 'utf8'
      [404, 'POSIX utility not found: %s' % util]
    end
  end

  get '/styles.css' do
    content_type 'text/css'
    File.read('styles.css')
  end
end
use Shortcut

run ShowOff.new
