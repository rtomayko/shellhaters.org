require "showoff"
require "sinatra"

Dir.chdir File.dirname(__FILE__)

class Shortcut < Sinatra::Base
  %w[/posix /cheat].each do |url|
    get url do
      content_type 'text/html', :charset => 'utf8'
      File.read('cheat.html')
    end
  end

  get '/styles.css' do
    content_type 'text/css'
    File.read('styles.css')
  end
end
use Shortcut

run ShowOff.new
