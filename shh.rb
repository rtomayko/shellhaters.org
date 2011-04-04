require 'rdiscount'
require 'sinatra'

class SHH < Sinatra::Base
  enable :static

  get '/' do
    content_type 'text/html', :charset => 'utf8'
    File.read('index.html')
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
      @title = "The Hater's Shortcut to The POSIX Shell and Utilities"
      @body_class = 'cheat'
      erb :cheat
    end
  end

  get '/awkward' do
    content_type 'text/html', :charset => 'utf8'
    File.read('awkward.html')
  end

  get '/styles.css' do
    content_type 'text/css'
    send_file 'styles.css'
  end
end
