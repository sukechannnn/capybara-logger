require 'bundler/setup'
Bundler.require(:default, :development)

class TestSite < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/' do
    @posted_text = params[:text]
    erb :index
  end

  post '/file' do
    filename = params[:file][:filename]
    file = params[:file][:tempfile]

    File.open("./tmp/#{filename}", 'wb') do |f|
      f.write(file.read)
    end

    erb :index
  end
end
