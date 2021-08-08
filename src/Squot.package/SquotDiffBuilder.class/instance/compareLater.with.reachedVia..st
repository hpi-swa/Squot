private
compareLater: leftValue with: rightValue reachedVia: aReference
	| newDiff |
	leftValue undecorated = rightValue undecorated ifTrue: [^ self].
	newDiff := walk addLeft: leftValue right: rightValue reachedVia: aReference.
	objectDiffs at: leftValue undecorated put: newDiff.