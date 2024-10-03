printing
printDescriptionOn: aStream
	aStream
		nextPutAll: 'Package ';
		nextPutAll: self package name;
		nextPutAll: ' at ';
		nextPutAll: (SquotPathUtilities asString: self path);
		nextPutAll: ' encoded using ';
		nextPutAll: self encodingName.