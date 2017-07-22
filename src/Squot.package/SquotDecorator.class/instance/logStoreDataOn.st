as yet unclassified
logStoreDataOn
	FSLocator imageDirectory / 'store-names.txt' writeStreamDo: [:stream |
		stream
			print: self squotDecoratorClass name;
			nextPutAll: ' --> ';
			print: decoratedObject].