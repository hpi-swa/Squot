merging
squotMergeWith: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata
	| walk diffs conflicts |
	diffs := Dictionary new.
	conflicts := Dictionary new.
	walk := SquotGraphMergeWalk startingFrom: self and: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata.
	walk do:
		[:working :incoming :base |
		walk followReferencesIfReplaced: [:path | diffs at: path put: (SquotObjectReplacement left: working right: incoming)]
			ifReplacedDifferently: [:path | conflicts at: path put: (SquotObjectReferenceConflict key: path base: base working: working incoming: incoming)]
			ifRemoved: [:removed :path | diffs at: path put: (SquotObjectRemoval of: removed)]
			ifWorkingChanged: [:changed :original :path | conflicts at: path put: (SquotObjectReferenceConflict key: path base: original working: changed incoming: nil)]
			ifIncomingChanged: [:changed :original :path | conflicts at: path put: (SquotObjectReferenceConflict key: path base: original working: nil incoming: changed)]
			ifAdded: [:added :path | diffs at: path put: (SquotObjectAddition of: added)]
			ifAddedDifferently: [:addedWorking :addedIncoming :path | conflicts at: path put: (SquotObjectAdditionConflict working: addedWorking incoming: addedIncoming)]
			ifAlreadyVisited: [self error: 'Multiple paths']].
	^ SquotTrackedObjectMetadataMerge into: self merge: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata diffs: diffs conflicts: conflicts