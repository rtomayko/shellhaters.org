require "showoff"
require "sinatra"

Dir.chdir File.dirname(__FILE__)

class Shortcut < Sinatra::Base
  %w[/index /].each do |url|
    get url do
      content_type 'text/html', :charset => 'utf8'
      File.read('index.html')
    end
  end

  get '/deck' do |url|
    @env['REQUEST_PATH'] = '/'
    @env['PATH_INFO'] = '/'
    @env['REQUEST_URL'] = '/'
    forward
  end

  %w[/posix /cheat].each do |url|
    get url do
      content_type 'text/html', :charset => 'utf8'
      File.read('cheat.html')
    end
  end

  %w[/awkward].each do |url|
    get url do
      content_type 'text/html', :charset => 'utf8'
      File.read('awkward.html')
    end
  end

  get '/styles.css' do
    content_type 'text/css'
    File.read('styles.css')
  end
end

use Shortcut
run ShowOff.new
