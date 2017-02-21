accessing
requestName
	self flag: 'this is basically a nightmare...'.
	((Smalltalk class canUnderstand: #isHeadless) and: [ Smalltalk isHeadless ])
		ifTrue: [ self error: 'Please set the default name using GitStamp defaultName:' ].
	^UIManager default 
		request: 'Please provide your full name to identify your actions.'
		initialAnswer: 'Firstname Lastname'