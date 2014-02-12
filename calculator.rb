#Checks if the given parameter is a rational number
#
#input - the (String) value to test
def isNumber (input)
	true if Float(input) rescue false
end

#Performs factorial
#
#num - the Integer value to perform factorial on
def factorial (num)
	(1..num).inject(:*) || 1
end

#Prompts the user to enter two operands and and operator and performs the operation.
def calculator
	#variables to store the operation parameters (all Strings)
	num1, operator, num2, answer = '', '', '', ''
	
	#valid operators available
	validOperators = ['+', '-', '*', '/', '^', '%', '!']
	
	#get user input of first operand
	print('Enter first operand: >> ')
	while !isNumber(num1 = gets.chomp) #get and validate input
		print 'Please enter a valid number: >> '
	end
	
	#gets user input of operator
	print('Enter operator (+, -, *, /, ^, %, !): >> ')
	while !validOperators.include?(operator = gets.chomp) #get and validate input
		print 'Please enter a valid operator: '
	end
	
	if operator == '^' then operator = '**' end #change caret to Ruby power function
	
	if operator == '!' then #perform factorial
		answer = factorial(num1.to_i)
		puts(num1.to_s + '! =' + answer.to_s)
	else #perform other operations
		print('Enter second operand: >> ')
		while !isNumber(num2 = gets.chomp) #get and validate input
			print 'Please enter a valid number: >> '
		end
		
		#convert operands to floats
		num1 = Float(num1)
		num2 = Float(num2)
		
		if((operator == '/' || operator == '%') && num2 == 0) #divide by zero checks
			puts 'Result is undefined.'
		else
			operation = (num1.to_s + ' ' + operator + ' ' + num2.to_s) #string representation of the operation
			answer = eval(operation) #evaluate the full operation
			puts (operation + ' = ' + answer.to_s) #print answer
		end
	end
	
	
end

calculator
