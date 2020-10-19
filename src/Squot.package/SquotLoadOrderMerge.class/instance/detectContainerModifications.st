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
	(workingAdditions select: [:each | incomingAdditions includes: each]) do:
		[:each | | workingDependents incomingDependents |
		"Is a conflict if and only if their remaining successors are different."
		workingDependents := (working copyAfter: each) copyWithoutAll: removals.
		incomingDependents := incoming copyAfter: each.
		((incomingDependents includesAllOf: workingDependents)
			and: [workingDependents includesAllOf: incomingDependents])
			ifFalse:
				[containerConflicts at: each put:
					(SquotLoadOrderConflict additionOf: each in: self)]].