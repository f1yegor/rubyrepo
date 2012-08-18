def is_simple?(number)
	return false if number==1
	for i in (2..number/2)
		return false if number % i == 0
	end
	return true
end

def number_decomposition(number)
	simple1, simple2 = number/2, number/2
	while simple1>1 and simple2<number
		if is_simple? simple1 and is_simple? simple2
			puts "Answer: #{simple1}+#{simple2}=#{number}"
			return
		end
		simple1-=1
		simple2+=1
	end
	puts "no decomposition"
end

puts "Please, Enter EVEN number"
number_decomposition(gets.to_i)