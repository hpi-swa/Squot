as yet unclassified
printOn: aStream
	aStream
		nextPutAll: 'Package ';
		nextPutAll: self package name;
		nextPutAll: ' encoded using Tonel'.