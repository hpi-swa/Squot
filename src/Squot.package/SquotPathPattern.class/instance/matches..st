testing
matches: aPath
	self path size = 0 ifTrue: [^ self allowsLeading or: [self allowsTrailing] or: [aPath size = 0]].
	aPath size < self path size ifTrue: [^ false].
	^ self allowsLeading
		ifFalse: [self matches: aPath startingAt: 1]
		ifTrue: [ | lastMatchStart |
			lastMatchStart := aPath size - self path size + 1.
			self allowsTrailing
				ifFalse: [self matches: aPath startingAt: lastMatchStart]
				ifTrue: [(1 to: lastMatchStart) anySatisfy: [:index | self matches: aPath startingAt: index]]]