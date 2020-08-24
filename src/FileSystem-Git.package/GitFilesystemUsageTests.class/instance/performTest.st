running
performTest
	^ [super performTest]
		on: Warning do:
			[:w | ('*unit of work*' match: w messageText)
				ifTrue: [self fail: 'Missing unit of work']
				ifFalse: [w pass]]