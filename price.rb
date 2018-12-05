def price(pizza)
	price = 0
	pizza.each do |za|
		if za[1] == "small"
			price += 6
		elsif za[1] == "medium"
			price += 7
		elsif za[1] == "large"
			price += 8
		elsif za[1] == "x-large"
			price += 9
		elsif za[1] == "monster"
			price += 100
		end
		if za[2] == "fred"
			price += 10
		else
			price += 2
		end
		price += 4
		za[5].each do
			price += 1.25
		end
		price = price * za[0].to_i

	end
	return price
end