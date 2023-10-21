testing
path: aPath containsOrEquals: anotherPath
	aPath size <= anotherPath size ifFalse: [^ false].
	1 to: aPath size do: [:index |
		(aPath at: index) = (anotherPath at: index) ifFalse: [^ false]].
	^ true