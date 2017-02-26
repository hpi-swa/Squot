support
contents: aByteArray
	stream := filesystem writeStreamOn: 'griffle'.
	stream binary.
	stream nextPutAll: aByteArray.
	stream close.
	stream := filesystem readStreamOn: 'griffle'.
	stream binary.