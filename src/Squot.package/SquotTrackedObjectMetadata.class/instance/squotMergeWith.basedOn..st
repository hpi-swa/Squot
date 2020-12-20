merging
squotMergeWith: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata
	| walk diffs conflicts |
	diffs := Dictionary new.
	conflicts := Dictionary new.
	walk := SquotGraphMergeWalk startingFrom: self and: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata.
	walk do:
		[:working :incoming :base |
		walk followReferencesOf: working and: incoming basedOn: base
			ifOpaqueDifference: [:path | diffs at: path put: (SquotObjectReplacement left: working right: incoming)]
			ifOpaqueConflict:
				[:path | conflicts at: path put: (SquotObjectReferenceConflict key: path base: base working: working incoming: incoming)]
			ifAdditionConflict: [:addedWorking :addedIncoming :path | conflicts at: path put: (SquotObjectAdditionConflict working: addedWorking incoming: addedIncoming)]
			ifRemovedInIncoming: [:removed :path | diffs at: path put: (SquotObjectRemoval of: removed)]
			ifChangedInWorkingButRemovedInIncoming: [:changed :original :path | conflicts at: path put: (SquotObjectReferenceConflict key: path base: original working: changed incoming: nil)]
			ifRemovedInWorkingButChangedInIncoming: [:changed :original :path | conflicts at: path put: (SquotObjectReferenceConflict key: path base: original working: nil incoming: changed)]
			ifOnlyIncoming: [:added :path | diffs at: path put: (SquotObjectAddition of: added)]
			ifAlreadyVisited: [self error: 'Multiple paths']].
	^ SquotTrackedObjectMetadataMerge into: self merge: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata diffs: diffs conflicts: conflicts