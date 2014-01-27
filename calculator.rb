#Checks if the given parameter is a rational number
def isNumber (input)
	true if Float(input) rescue false
end

#Perform factorial
def factorial (num)
	(1..num).inject(:*) || 1
end

#Prompts the user to enter two operands and and operator and performs the operation.
def calculator
	#variables to store the operation parameters
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
	
	if operator == '!' then #perform factorial
		answer = factorial(num1)
		puts(num1.to_s + '! =' + answer.to_s)
	else #perform other operations
		print('Enter second operand: >> ')
		while !isNumber(num2 = gets.chomp) #get and validate input
			print 'Please enter a valid number: >> '
		end
		operation = (num1 + ' ' + operator + ' ' + num2) #string representation of the operation
		answer = eval(operation) #evaluate the full operation
		puts (operation + ' = ' + answer.to_s) #print answer
	end
	
	
end

calculator
