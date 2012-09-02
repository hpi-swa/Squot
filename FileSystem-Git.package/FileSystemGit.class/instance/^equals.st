comparing
= other
	(self name isEmptyOrNil and: [ other name isEmptyOrNil ])
		ifFalse: [ ^ self name = other name ]
		ifTrue: [ ^ self == other ]