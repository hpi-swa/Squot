validating
collectUnreachableErrors	
	unreachable do: [ :each|
		self collectError: 'unreachable object' for: each].