exceptioninstantiator
signal: aString with: data
	^ self new
		signal: aString;
		data: data