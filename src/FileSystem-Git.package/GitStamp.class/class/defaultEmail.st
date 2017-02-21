accessing
defaultEmail
	DefaultEmail isEmptyOrNil 
		ifTrue: [ ^ GitStampEmailRequest signal ]
		ifFalse: [ ^ DefaultEmail ].
	^ self defaultEmail