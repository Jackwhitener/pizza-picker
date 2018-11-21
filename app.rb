require 'sinatra'
get '/' do
	erb :start
end
post '/start' do
	redirect '/pizza?'
end
get '/pizza' do
	erb :pizza
end
post '/pizza' do
	size = Array.new
	bread = Array.new
	sauce = Array.new
	cheese = Array.new
	toppings = Array.new
	size << params[:size]
	bread << params[:bread]
	sauce = params[:sauce]
	cheese = params[:cheese]
	toppings = params[:toppings]
	redirect '/verify?size=' + size.to_s + '&bread=' + bread.to_s + '&sauce=' + sauce.to_s + '&cheese=' + cheese.to_s + '&toppings=' + toppings.to_s
end
get '/verify' do
	size = eval(params[:size])
	bread = eval(params[:bread])
	sauce = eval(params[:sauce])
	cheese = eval(params[:cheese])
	toppings = eval(params[:toppings])
	erb :verify, locals: {size: size, bread: bread, sauce: sauce, cheese: cheese, toppings: toppings}
end
post '/verify' do
	size = eval(params[:size])
	bread = eval(params[:bread])
	sauce = eval(params[:sauce])
	cheese = eval(params[:cheese])
	toppings = eval(params[:toppings])
	correct = params[:correct]
	puts "Is it correct: #{correct}"
	if correct == 'yes'
		redirect 'yes?size=' + size.to_s + '&bread=' + bread.to_s + '&sauce=' + sauce.to_s + '&cheese=' + cheese.to_s + '&toppings=' + toppings.to_s
	elsif correct == 'no'
		redirect '/pizza?'
	end
end
get '/yes' do
	size = params[:size]
	bread = params[:bread]
	sauce = params[:sauce]
	cheese = params[:cheese]
	toppings = params[:toppings]
erb :yes, locals: {size: size, bread: bread, sauce: sauce, cheese: cheese, toppings: toppings}
end
post '/address' do
	size = params[:size]
	bread = params[:bread]
	sauce = params[:sauce]
	cheese = params[:cheese]
	toppings = params[:toppings]
	address = params[:address]
	instorepickup = params[:instorepickup]
	redirect '/final?size=' + size.to_s + '&bread=' + bread.to_s + '&sauce=' + sauce.to_s + '&cheese=' + cheese.to_s + '&toppings=' + toppings.to_s + '&address=' + address.to_s + '&instorepickup=' + instorepickup
end
get '/final' do
	size = eval(params[:size])
	bread = eval(params[:bread])
	sauce = eval(params[:sauce])
	cheese = eval(params[:cheese])
	toppings = eval(params[:toppings])
	address = eval(params[:address])
	instorepickup = params[:instorepickup]
	erb :final, locals: {size: size, bread: bread, sauce: sauce, cheese: cheese, toppings: toppings, address: address, instorepickup: instorepickup}
end