merging
squotMergeWith: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata
	| walk diffs conflicts |
	diffs := Dictionary new.
	conflicts := Dictionary new.
	walk := SquotGraphMergeWalk startingFrom: self and: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata.
	walk do:
		[:working :incoming :base |
		walk followReferencesIfReplaced: [:path | diffs at: path put: (SquotReferenceTargetExchange reference: path last leftOwner: nil target: working rightOwner: nil target: incoming)]
			ifReplacedDifferently: [:path | conflicts at: path put: (SquotObjectReferenceConflict key: path last base: base working: working incoming: incoming)]
			ifRemoved: [:removed :path | diffs at: path put: (SquotReferenceRemoval from: working reference: path last rightObject: incoming)]
			ifWorkingChanged: [:changed :original :path | conflicts at: path put: (SquotObjectReferenceConflict key: path last base: original working: changed incoming: nil)]
			ifIncomingChanged: [:changed :original :path | conflicts at: path put: (SquotObjectReferenceConflict key: path last base: original working: nil incoming: changed)]
			ifAdded: [:added :path | diffs at: path put: (SquotReferenceAddition to: working reference: path last target: added rightOwner: incoming)]
			ifAddedDifferently: [:addedWorking :addedIncoming :path | conflicts at: path put: (SquotReferenceAdditionConflict reference: path last working: addedWorking incoming: addedIncoming)]
			ifAlreadyVisited: [self error: 'Multiple paths']].
	^ SquotTrackedObjectMetadataMerge into: self merge: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata diffs: diffs conflicts: conflicts