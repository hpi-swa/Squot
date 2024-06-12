class initialization
requestName
	self flag: 'this is basically a nightmare...'.
	((Smalltalk class canUnderstand: #isHeadless) and: [ Smalltalk isHeadless ])
		ifTrue: [ self error: 'Please set the default name using GitStamp defaultName:' ].
	^ (GitUI 
		request: 'Please provide your full name for the authorship information of your Git commits.'
		initialAnswer: 'Firstname Lastname') withBlanksTrimmed