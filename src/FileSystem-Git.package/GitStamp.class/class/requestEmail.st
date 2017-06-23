accessing
requestEmail
	self flag: 'this is basically a nightmare...'.
	((Smalltalk class canUnderstand: #isHeadless) and: [ Smalltalk isHeadless ])
		ifTrue: [ self error: 'Please set the default email using GitStamp defaultEmail:' ].
	^UIManager default 
		request: 'Please provide a valid e-mail address for your Git commits so that you can be contacted if necessary.'
		initialAnswer: 'user@domain.ext'