require 'sinatra'
get '/' do
	erb :start
end
require_relative 'price.rb'
post '/start' do
	pizza = Array.new
	redirect '/pizza?pizza=' + pizza.to_s
end
get '/pizza' do
	pizza = params[:pizza]
	erb :pizza, locals: {pizza: pizza}
end
post '/pizza' do
	pizza = eval(params[:pizza])
	addedpizza = Array.new
	toppings = String.new
	addedpizza << params[:numberofpizzas]
	addedpizza << params[:size]
	addedpizza << params[:bread]
	addedpizza << params[:sauce]
	addedpizza << params[:cheese]
	if params[:toppings] == nil
		addedpizza << ["nothing"]
	else 
		addedpizza << params[:toppings]
	end
	pizza << addedpizza
	puts "pizza @ '/pizza': #{pizza}"
	# pizza.delete_at(0)
	redirect '/verify?pizza=' + pizza.to_s
end
get '/verify' do
	pizza = eval(params[:pizza])
	erb :verify, locals: {pizza: pizza}
end
post '/verify' do
	puts "pizza @ '/verify'pizza"
	pizza = params[:pizza]
	addpizza = params[:addpizza]
	if addpizza == 'No'
		redirect '/yes?pizza=' + pizza.to_s
	elsif addpizza == 'Yes'
		redirect '/pizza?pizza=' + pizza.to_s
	end
end
get '/yes' do
	pizza = params[:pizza]
erb :yes, locals: {pizza: pizza}
end
post '/address' do
	puts "pizza @ '/address'pizza"
	pizza = params[:pizza]
	address = params[:address]
	instorepickup = params[:instorepickup]
	redirect '/final?pizza=' + pizza + '&address=' + address.to_s + '&instorepickup=' + instorepickup.to_s
end
get '/final' do
	pizza = eval(params[:pizza])
	puts "pizzas: #{pizza}"
	address = eval(params[:address])
	instorepickup = params[:instorepickup]
	prices = price(pizza)
	puts prices
	erb :final, locals: {pizza: pizza, address: address, instorepickup: instorepickup, prices: prices}
end