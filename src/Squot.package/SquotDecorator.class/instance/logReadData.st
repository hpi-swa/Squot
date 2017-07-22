as yet unclassified
logReadData
	FSLocator imageDirectory / 'read-names.txt' writeStreamDo: [:stream |
		stream
			print: self squotDecoratorClass name;
			nextPutAll: ' --> ';
			print: decoratedObject].