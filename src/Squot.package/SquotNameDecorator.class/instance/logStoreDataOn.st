as yet unclassified
logStoreDataOn
	FSLocator imageDirectory / 'store-names.txt' writeStreamDo: [:stream |
		stream
			setToEnd;
			print: name;
			nextPutAll: ' <---> ';
			print: decoratedObject;
			cr].