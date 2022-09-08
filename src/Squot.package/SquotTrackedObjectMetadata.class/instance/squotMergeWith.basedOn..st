merging
squotMergeWith: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata
	| walk diffs conflicts pathToArtifactId |
	diffs := Dictionary new.
	conflicts := Dictionary new.
	walk := SquotGraphMergeWalk startingFrom: self and: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata.
	pathToArtifactId := {SquotDictionaryEntry key: #id}. "Ignore all differences in the artifact id."
	walk do:
		[:working :incoming :base :workingReferrer :incomingReferrer :baseReferrer |
		walk
			followReferencesIfReplaced:
				[:path | path ~= pathToArtifactId
					ifTrue: [diffs at: path
								put: (SquotReferenceTargetExchange reference: path last
										leftOwner: workingReferrer target: working
										rightOwner: incomingReferrer target: incoming)]]
			ifReplacedDifferently:
				[:path | path ~= pathToArtifactId
					ifTrue: [conflicts at: path
							put: (SquotObjectReferenceConflict key: path last
									base: base working: working incoming: incoming)]]
			ifRemoved:
				[:removed :path |
				path ~= pathToArtifactId
					ifTrue: [diffs at: path
							put: (SquotReferenceRemoval of: removed from: working
									reference: path last rightObject: incoming)]]
			ifWorkingChanged:
				[:changed :original :path |
				path ~= pathToArtifactId
					ifTrue: [conflicts at: path
							put: (SquotObjectReferenceConflict key: path last
									base: original working: changed incoming: nil)]]
			ifIncomingChanged:
				[:changed :original :path |
				path ~= pathToArtifactId
					ifTrue: [conflicts at: path
								put: (SquotObjectReferenceConflict key: path last
										base: original working: nil incoming: changed)]]
			ifAdded: [:added :path | diffs at: path put: (SquotReferenceAddition to: working reference: path last target: added rightOwner: incoming)]
			ifAddedDifferently:
				[:addedWorking :addedIncoming :path |
				path ~= pathToArtifactId
					ifTrue: [conflicts at: path
								put: (SquotReferenceAdditionConflict reference: path last
										working: addedWorking owner: working incoming: addedIncoming owner: incoming)]]
			ifAlreadyVisited: [self error: 'Multiple paths']].
	^ SquotTrackedObjectMetadataMerge into: self merge: incomingTrackedObjectMetadata basedOn: baseTrackedObjectMetadata diffs: diffs conflicts: conflicts