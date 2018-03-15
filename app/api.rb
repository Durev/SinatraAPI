require 'bundler/setup'
require 'sinatra/base'
require 'json'

class Api < Sinatra::Base

	get '/hello' do
		'Hello world!'
	end

  get '/movies' do
    content_type :json
    File.read('data.json')
  end

end
