callbacks
prepareMerge: workingObjectReflection with: incomingObjectReflection basedOn: baseObjectReflection reachedVia: aReference ifSkipping: skipBlock
	"SquotDiffBuilder enqueues instances in the walk if the values are not equal. It also creates a new object merge for the instances here."
	"If workingReferent object is not already known to have any differences, SquotDiffBuilder remembers referrers here, so that it can add deep difference hints later if necessary."
	| isGraphItself id |
	isGraphItself := workingObjectReflection object == working.
	(isGraphItself not and: [workingObjectReflection shouldHaveNameAssigned not]) ifTrue: [^ skipBlock value].
	workingObjectReflection object undecorated = incomingObjectReflection object undecorated ifTrue: [^ skipBlock value].
	id := ids at: workingObjectReflection object undecorated
		ifAbsent: [working nameOf: workingObjectReflection object undecorated ifAbsent: []].
	reflections at: workingObjectReflection object undecorated put: workingObjectReflection.
	merges at: id
		put: (workingObjectReflection mirror
			newMergeOf: workingObjectReflection object undecorated
			with: incomingObjectReflection object undecorated
			basedOn: baseObjectReflection object undecorated).