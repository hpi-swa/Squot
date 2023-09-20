requests
requestEncoding
	| encodings |
	encodings := self validEncodings.
	^ UIManager default
		chooseFrom: (encodings collect: [:each | self encodingName: each])
		values: encodings
		title: 'Encoding:'.