accessing
readSideBandResponseFrom: aStream ifData: dataBlock ifMessage: messageBlock ifError: errorBlock
	| length streamCode data |
	length := self readContentLengthFrom: aStream.
	streamCode := aStream next.
	streamCode > 3
		ifTrue: [ self error: 'Unknown stream code ', streamCode asString].
	data := aStream next: length - 5. "4-byte content length + streamCode byte"
	streamCode = 1
		ifTrue: [^ dataBlock value: data ].
	streamCode = 2
		ifTrue: [^ messageBlock value: data ].
	streamCode = 3
		ifTrue: [^ errorBlock value: data ].
	self error: 'Should never happen '