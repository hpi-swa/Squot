testing
matches: aPath startingAt: aNumber
	| matchEnd |
	matchEnd := aNumber + self path size - 1.
	aPath size < matchEnd ifTrue: [^ false].
	(self allowsTrailing not ==> [aPath size = matchEnd]) ifFalse: [^ false].
	aNumber to: matchEnd do: [:index |
		(aPath at: index) = (self path at: index - aNumber + 1) ifFalse: [^ false]].
	^ true