building
enqueueDisappearedInstances: incomingTargetReflection base: baseTargetReflection reachedVia: aReference
	"Add the targets to the walk to detect further objects behind them if the incoming version has not been visited yet."
	| alreadyVisited |
	mirrors at: baseTargetReflection object put: baseTargetReflection mirror;
		at: incomingTargetReflection object put: incomingTargetReflection mirror.
	alreadyVisited := false.
	walk checkPathsTo: incomingTargetReflection object ifMultiple: [alreadyVisited := true].
	alreadyVisited
		ifTrue:
			[| referrers | referrers := walk currentReferrer.
			client foundAnotherPathToDisappeared: incomingTargetReflection reachedVia: aReference from: referrers third]
		ifFalse:
			[client disappeared: incomingTargetReflection reachedVia: aReference ifSkipping: [ ^ self ].
			walk add: {self nilReflection. baseTargetReflection. incomingTargetReflection} reachedVia: aReference].