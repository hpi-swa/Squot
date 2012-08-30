accessing
defaultName
	DefaultName isEmptyOrNil 
		ifTrue: [ ^ GitStampNameRequest signal ]
		ifFalse: [ ^ DefaultName ].
	^ self defaultName