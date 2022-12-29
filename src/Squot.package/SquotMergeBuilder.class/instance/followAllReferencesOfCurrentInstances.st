building
followAllReferencesOfCurrentInstances
	| workingReflected baseReflected incomingReflected nextInIncoming nextInWorking nextInBase |
	workingReflected := currentTuple first.
	baseReflected := currentTuple second.
	incomingReflected := currentTuple third.
	(workingReflected references intersection: incomingReflected references) do:
		[:each | | path workingReferent |
		path := walk currentPath copyWith: each.
		nextInIncoming := incomingReflected nextReflection: each.
		mirrors at: nextInIncoming object put: nextInIncoming mirror.
		nextInWorking := nextInIncoming mirror instanceOf: nextInIncoming object from: incomingRoot path: path in: workingRoot ifAbsent: [].
		nextInBase := nextInIncoming mirror instanceOf: nextInIncoming object from: incomingRoot path: path in: baseRoot ifAbsent: [].
		workingReferent := workingReflected nextReflection: each.
		mirrors at: workingReferent object put: workingReferent mirror.
		(client is: nextInWorking instanceOf: workingReferent object)
			ifTrue: "No need to update the reference"
				[mirrors at: nextInWorking put: workingReferent mirror.
				client reached: workingReferent at: path.
				(baseReflected references includes: each)
					ifTrue:
						[| baseReferent | baseReferent := baseReflected nextReflection: each.
						mirrors at: baseReferent object put: baseReferent mirror.
						(client is: nextInBase instanceOf: baseReferent object)
							ifTrue: "Nothing changed"
								[self enqueueInstances: workingReferent base: baseReferent incoming: nextInIncoming reachedVia: each]
							ifFalse: "Both versions changed the reference to the same object"
								[self enqueueInstances: workingReferent base: (SquotObjectReflection object: nextInBase mirror: (nextInBase ifNotNil: [nextInIncoming mirror] ifNil: [self nilReflection mirror])) incoming: nextInIncoming reachedVia: each]]
					ifFalse: "Both introduced a reference to the same object"
						[self enqueueInstances: workingReferent base: (SquotObjectReflection object: nextInBase mirror: (nextInBase ifNotNil: [nextInIncoming mirror] ifNil: [self nilReflection mirror])) incoming: nextInIncoming reachedVia: each]]
			ifFalse: "Reference was changed"
				[(baseReflected references includes: each)
					ifTrue:
						[| baseReferent | baseReferent := baseReflected nextReflection: each.
						mirrors at: baseReferent object put: baseReferent mirror.
						(client is: nextInBase instanceOf: baseReferent object)
							ifTrue: "Working copy is unique"
								["Keep changed target"
								mirrors at: nextInBase put: baseReferent mirror.
								client reached: workingReferent at: path.
								nextInWorking
									ifNotNil:
										["If the incoming object is not entirely new, it was already referenced from somewhere else in the working copy. It will be enqueued from there if necessary."
										self flag: #todo. "What if there are deep differences between nextInBase and nextInWorking?" "Irrelevant for metadata"]
									ifNil: [self enqueueNewInstances: nextInIncoming base: baseReferent reachedVia: each. "Irrelevent for metadata"]]
							ifFalse: "Incoming version is unique"
								[(client is: (workingReferent mirror instanceOf: workingReferent object from: workingRoot path: path in: baseRoot ifAbsent: []) instanceOf: baseReferent object)
									ifTrue: "Was changed only in incoming"
										[client changed: workingReferent to: nextInIncoming at: path]
									ifFalse: "Was changed in working copy, too"
										[client conflictingChanged: workingReferent to: nextInIncoming base: baseReferent at: path].
								nextInWorking
									ifNotNil: 
										["If the incoming object is not entirely new, it was already referenced from somewhere else in the working copy. It will be enqueued from there if necessary."]
									ifNil:
										[self enqueueNewInstances: nextInIncoming base: (SquotObjectReflection object: nextInBase mirror: (nextInBase ifNotNil: [nextInIncoming mirror] ifNil: [self nilReflection mirror])) reachedVia: each].
								self flag: #todo. "Consider whether workingReferent must be removed when applying this merge."]]
					ifFalse: "Reference was added in both versions, but differently."
						[client conflictingAdded: workingReferent and: nextInIncoming at: path.
						nextInWorking
							ifNotNil: 
								["If the incoming object is not entirely new, it was already referenced from somewhere else in the working copy. It will be enqueued from there if necessary."]
							ifNil:
								[self enqueueNewInstances: nextInIncoming base: (SquotObjectReflection object: nextInBase mirror: (nextInBase ifNotNil: [nextInIncoming mirror] ifNil: [self nilReflection mirror])) reachedVia: each]]]].
	(workingReflected references copyWithoutAll: incomingReflected references) do:
		[:each | | path |
		path := walk currentPath copyWith: each.
		nextInWorking := workingReflected nextReflection: each.
		mirrors at: nextInWorking object put: nextInWorking mirror.
		nextInIncoming := nextInWorking mirror instanceOf: nextInWorking object from: workingRoot path: path in: incomingRoot ifAbsent: [].
		nextInBase := nextInWorking mirror instanceOf: nextInWorking object from: workingRoot path: path in: baseRoot ifAbsent: [].
		(baseReflected references includes: each)
			ifFalse:
				["Leave reference added"
				"If the incoming graph has any differences in the referent, the graph will have a reference to it elsewhere. The differences will be detected at the other reference. If it is not referenced anywhere else, the incoming graph cannot introduce any changes to it." "For metadata, the referent cannot be referenced from anywhere else." "For projects the project cannot be referenced from anywhere else."
				client reached: nextInWorking at: path]
			ifTrue: "Incoming version has the reference removed"
				[| baseReferent | baseReferent := baseReflected nextReflection: each.
				(client is: nextInBase instanceOf: baseReferent object)
					ifTrue: "Working copy did not change the reference, so remove it"
						[client removed: nextInWorking at: path]
					ifFalse: "Working copy changed the reference"
						[client conflictingRemoved: nextInWorking base: baseReferent at: path]].
		"Do not enqueue the removed referent in the walk. If the removed object has any differences in the incoming graph, the graph will have a reference to the object elsewhere. The differences will be detected at the other reference. If it is not referenced anywhere else it will be removed from the graph and needs not be further investigated (unless we need to enumerate all objects to be removed, which may be behind nextInWorking). The incoming graph cannot introduce any changes to it then." "For metadata, the removed object cannot be referenced anywhere else."].
	(incomingReflected references copyWithoutAll: workingReflected references) do:
		[:each | | path |
		path := walk currentPath copyWith: each.
		nextInIncoming := incomingReflected nextReflection: each.
		mirrors at: nextInIncoming object put: nextInIncoming mirror.
		nextInWorking := nextInIncoming mirror instanceOf: nextInIncoming object from: incomingRoot path: path in: workingRoot ifAbsent: [].
		nextInBase := nextInIncoming mirror instanceOf: nextInIncoming object from: incomingRoot path: path in: baseRoot ifAbsent: [].
		(baseReflected references includes: each)
			ifFalse:
				[client added: nextInIncoming at: path.
				nextInWorking
					ifNotNil: [self enqueueInstances: (SquotObjectReflection object: nextInWorking mirror: nextInIncoming mirror) base: (SquotObjectReflection object: nextInBase mirror: (nextInBase ifNotNil: [nextInIncoming mirror] ifNil: [self nilReflection mirror])) incoming: nextInIncoming reachedVia: each]
					ifNil: [self enqueueNewInstances: nextInIncoming base: (SquotObjectReflection object: nextInBase mirror: (nextInBase ifNotNil: [nextInIncoming mirror] ifNil: [self nilReflection mirror])) reachedVia: each]]
			ifTrue: "Working copy has the reference removed"
				[| baseReferent | baseReferent := baseReflected nextReflection: each.
				(client is: nextInBase instanceOf: baseReferent object)
					ifTrue: "Reference not changed in incoming version."
						["Leave it removed"
						client removedFromWorkingCopy: baseReferent at: path.
						nextInWorking
							ifNotNil:
								["Object still exists in the working copy, but elsewhere. Wait until it is encountered at the other reference."]
							ifNil:
								[self enqueueDisappearedInstances: nextInIncoming base: baseReferent reachedVia: each. "Irrelevant for metadata."]]
					ifFalse: "Reference was changed to a different object in incoming version"
						[client conflictingRemovedFromWorkingCopy: baseReferent incoming: nextInIncoming at: path.
						nextInWorking
							ifNotNil:
								[self enqueueInstances: (SquotObjectReflection object: nextInWorking mirror: nextInIncoming mirror) base: (SquotObjectReflection object: nextInBase mirror: (nextInBase ifNotNil: [nextInIncoming mirror] ifNil: [self nilReflection mirror])) incoming: nextInIncoming reachedVia: each]
							ifNil:
								[self enqueueNewInstances: nextInIncoming base: (SquotObjectReflection object: nextInBase mirror: (nextInBase ifNotNil: [nextInIncoming mirror] ifNil: [self nilReflection mirror])) reachedVia: each]]]].