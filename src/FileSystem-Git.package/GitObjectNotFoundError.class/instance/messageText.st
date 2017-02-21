printing
messageText
	^ String streamContents: [ :stream |
		stream
			nextPutAll: messageText;
			nextPutAll: ' Known object data: ';
			nextPutAll: data printString ] 