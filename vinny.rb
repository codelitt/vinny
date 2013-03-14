require 'bundler/setup'
require 'sinatra'
require 'thin'
require 'haml'

class Vinny < Sinatra::Base 
	set :root, File.dirname(__FILE__)

	get '/' do 
		haml :index
	end

  # start the server if ruby file executed directly
  run! if app_file == $0
end