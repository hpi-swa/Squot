accessing
ignoreInstanceVariable: aString in: anObject
	| ignored |
	ignored := self ignoredInstanceVariables.
	ignored
		at: anObject
		put: ((ignored at: anObject ifAbsent: [Array empty])
				copyWith: aString).