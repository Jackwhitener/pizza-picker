def price(pizza)
	price = 0
	pizza.each do |za|
		if za[0] == "small"
			price += 8
		elsif za[0] == "medium"
			price += 10
		elsif za[0] == "large"
			price += 12
		elsif za[0] == "x-large"
			price += 14
		elsif za[0] == "monster"
			price += 100
		end
		if za[1] == "fred"
			price += 1000000
		else
			price += 2
		end
		price += 4
		za[4].each do
			price += 1.25
		end
	end
	return price
end