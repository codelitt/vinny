require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'
require 'sinatra/assetpack'
require 'erb'
require 'uglifier'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  Less.paths <<  "#{App.root}/app/css" 

  register Sinatra::AssetPack

  assets do 
    serve '/images', from: 'app/image'    # Optional

    js :bootstrap, '/js/main.js', [
      '/js/bootstrap*.js'
    ]

    css :bootstrap, [
      '/css/theme.css',
      '/css/responsive.css'
    ]

    js_compression :uglify

    prebuild true
  end

	get '/' do 
		erb :index
	end

  get '/contact' do 
    erb :contact
  end
end
