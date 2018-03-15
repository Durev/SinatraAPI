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

  get '/movies/:number' do
    content_type :json
    file = File.read('data.json')
    movies_list = JSON.parse(file)
    movies_list['movies']
      .select{ |movie| movie['id'] == params['number'].to_i }
      .to_json
  end

end
