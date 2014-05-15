require 'rdiscount'
require 'sinatra'

class SHH < Sinatra::Base
  enable :static

  get '/' do
    content_type 'text/html', :charset => 'utf8'
    @title = "The Shell Hater's Handbook"
    @body_class = 'home'
    @stylesheets = ['/styles.css']
    erb :index
  end

  # POSIX shell utilities cheat sheet
  %w[/posix /cheat].each do |url|
    get url do
      content_type 'text/html', :charset => 'utf8'
      @title = "The Hater's Shortcut to The POSIX Shell and Utilities"
      @body_class = 'cheat'
      @stylesheets = ['/styles.css']
      erb :cheat
    end
  end

  # the essay that accompanies the presentation
  get '/awkward' do
    content_type 'text/html', :charset => 'utf8'
    @title = "AWK-ward Ruby"
    @body_class = 'essay'
    @stylesheets = ['http://tomayko.com/css/tomayko.css']
    erb :essay
  end

  # pass /deck down to Showoff after faking root URLs
  get '/deck' do
    @env['REQUEST_PATH'] = '/'
    @env['PATH_INFO'] = '/'
    @env['REQUEST_URL'] = '/'
    forward
  end

  get '/styles.css' do
    content_type 'text/css'
    send_file 'styles.css'
  end

  def markdown(file)
    text = File.read(file)
    Markdown.new(text).to_html
  end
end
