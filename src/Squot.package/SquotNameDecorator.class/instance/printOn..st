printing
printOn: aStream
	aStream print: (name joinSeparatedBy: ' ');
		space;
		print: decoratedObject.