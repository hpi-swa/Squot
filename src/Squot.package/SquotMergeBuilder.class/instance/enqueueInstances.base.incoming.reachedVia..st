building
enqueueInstances: workingTargetReflection base: baseTargetReflection incoming: incomingTargetReflection reachedVia: aReference
	"Add the targets to the walk for later merging if the working copy version has not been visited yet."
	| alreadyVisited |
	self flag: #todo. "What if only the base object does not exist? Check senders?"
	mirrors at: workingTargetReflection object put: workingTargetReflection mirror;
		at: baseTargetReflection object put: baseTargetReflection mirror;
		at: incomingTargetReflection object put: incomingTargetReflection mirror.
	alreadyVisited := false.
	walk checkPathsTo: workingTargetReflection object ifMultiple: [alreadyVisited := true].
	alreadyVisited
		ifTrue:
			[| currentReferrers | currentReferrers := walk currentReferrer.
			currentReferrers ifNotNil:
				[client foundAnotherPathTo: workingTargetReflection incoming: incomingTargetReflection reachedVia: aReference from: currentReferrers first and: currentReferrers third]]
		ifFalse:
			[client prepareMerge: workingTargetReflection with: incomingTargetReflection basedOn: baseTargetReflection reachedVia: aReference ifSkipping: [ ^ self ].
			aReference
				ifNotNil:
					[walk add: {workingTargetReflection. baseTargetReflection. incomingTargetReflection} reachedVia: aReference]
				ifNil: [walk addFirst: {workingTargetReflection. baseTargetReflection. incomingTargetReflection}]].