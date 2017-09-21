as yet unclassified
printOn: aStream
	aStream nextPutAll: 'SquotPathChanged previous: ';
		print: previousPath;
		nextPutAll: ' new: ';
		print: newPath;
		nextPutAll: ' artifact: ';
		print: artifact.