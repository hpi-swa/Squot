private
compareLater: leftValue with: rightValue reachedVia: aReference
	| newDiff |
	leftValue undecorated = rightValue undecorated ifTrue: [^ self].
	"Attention: the comparison above might not return if shadows implement comparing and do not watch out for cycles in the object graph."
	newDiff := walk addLeft: leftValue right: rightValue reachedVia: aReference.
	objectDiffs at: leftValue undecorated put: newDiff.