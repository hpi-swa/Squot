private
computeDifferences
	| merger |
	merger := working mergeSnapshot: incoming basedOn: base.
	merger operations do:
		[:each | containerModifications at: each definition description put: each].
	merger conflicts do:
		[:each | containerConflicts at: each definition description put: each].