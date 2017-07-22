as yet unclassified
logReadData
	FSLocator imageDirectory / 'read-names.txt' writeStreamDo: [:stream |
		stream
			setToEnd;
			print: name;
			nextPutAll: ' <---> ';
			print: decoratedObject;
			cr].