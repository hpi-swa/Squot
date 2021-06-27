printing
printOn: aStream
	aStream print: decoratedObject;
		space;
		print: (name joinSeparatedBy: ' ').