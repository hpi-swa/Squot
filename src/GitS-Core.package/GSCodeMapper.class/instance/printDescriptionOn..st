printing
printDescriptionOn: aStream
	aStream
		nextPutAll: 'Package ';
		nextPutAll: self package name;
		nextPutAll: ' at ';
		nextPutAll: (GSPathUtilities asString: self path);
		nextPutAll: ' encoded using ';
		nextPutAll: self encodingName.