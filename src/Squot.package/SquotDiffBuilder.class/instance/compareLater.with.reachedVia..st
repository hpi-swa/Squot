private
compareLater: leftValue with: rightValue reachedVia: aReference
	| newDiff |
	newDiff := walk addLeft: leftValue right: rightValue reachedVia: aReference.
	objectDiffs at: leftValue undecorated put: newDiff.