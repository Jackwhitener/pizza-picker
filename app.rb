require 'sinatra'
get '/' do
	erb :start
end
post '/start' do
	redirect '/crust?'
end
get '/crust' do
	erb :crust
end
post '/crust' do
	size = Array.new
	size << params[:size]
	redirect '/bread?size=' + size.to_s
end
get '/bread' do
	size = params[:size]
	erb :bread, locals: {size: size}
end
