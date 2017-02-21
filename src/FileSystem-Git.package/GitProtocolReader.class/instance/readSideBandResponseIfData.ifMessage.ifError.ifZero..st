private receiving
readSideBandResponseIfData: dataBlock ifMessage: messageBlock ifError: errorBlock ifZero: zeroBlock
	| length streamCode data |
	length := self readLineLength.
	length = 0
		ifTrue: [ ^ zeroBlock value ].
	streamCode := stream next.
	streamCode > 3
		ifTrue: [ self error: 'Unknown stream code ', streamCode asString].
	data := stream next: length - 5. "4-byte content length + streamCode byte"
	streamCode = 1
		ifTrue: [^ dataBlock value: data ].
	streamCode = 2
		ifTrue: [^ messageBlock value: data ].
	streamCode = 3
		ifTrue: [^ errorBlock value: data ].
	self error: 'Should never happen '