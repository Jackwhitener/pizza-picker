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
	size = params[:size]
	redirect '/bread?size=' + size
end
get '/bread' do

end
