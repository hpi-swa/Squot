private
detectContainerModifications
	"Check for additions and removals."
	| workingAdditions incomingAdditions removals |
	workingAdditions := working copyWithoutAll: base.
	incomingAdditions := incoming copyWithoutAll: base.
	removals := working select: [:each | (incoming includes: each) not and: [base includes: each]].
	(incomingAdditions copyWithoutAll: workingAdditions)
		do: 	[:each | containerModifications at: each put: #add].
	removals do: [:each | containerModifications at: each put: #remove].
	"But working might have changes that conflict with the removal of items."