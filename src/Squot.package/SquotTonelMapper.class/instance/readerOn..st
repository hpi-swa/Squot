snapshot-creation
readerOn: aReference
	^ TonelReader
		on: aReference parent
		fileName: self package name