requests
formatFileName: aString
	^ aString asLowercase collect: [:each |
		(each isAlphaNumeric or: [each = $.])
			ifTrue: [each]
			ifFalse: [$_]]