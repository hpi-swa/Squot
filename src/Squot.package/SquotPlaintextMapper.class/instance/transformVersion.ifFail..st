ui
transformVersion: aString ifFail: aBlock
	^ self toPlaintext: (aString ifNil: [^ nil])