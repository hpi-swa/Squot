tests
testApplyModificationDoesNothing
	| merge left right |
	SquotToggles useNewApi ifTrue:
		[| base artifactA valueHolder |
		base := SquotWorkingCopy2 new
			putArtifact: (artifactA := SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdValueHeldAtPath: 'a'));
			putArtifact: (SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdValueHeldAtPath: 'b'));
			putArtifact: (SquotArtifact storeInfo: (SquotTrackedObjectMetadata withNewIdValueHeldAtPath: 'c'));
			yourself.
		valueHolder := ValueHolder new contents: 1; yourself.
		(base storeForArtifact: artifactA) contents: valueHolder. "Avoid start object replacement with 1 and 2 because the older diffing implementation does not deal well with it."
		SquotObjectStore objectRegistry assign: {UUID nilUUID} to: valueHolder.
		left := base copy.
		(left storeForArtifact: artifactA) contents: valueHolder copy.
		SquotObjectStore objectRegistry assign: (SquotObjectStore objectRegistry nameOf: valueHolder) to: (left storeForArtifact: artifactA) contents.
		right := base copy.
		(right storeForArtifact: artifactA) contents: valueHolder copy.
		SquotObjectStore objectRegistry assign: (SquotObjectStore objectRegistry nameOf: valueHolder) to: (right storeForArtifact: artifactA) contents.
		(right storeForArtifact: artifactA) contents contents: 2.
		merge := SquotProjectMergeFactory new merge: (SquotProjectSnapshot fromStore: right) into: (SquotProjectSnapshot fromStore: left) basedOn: (SquotProjectSnapshot fromStore: base).
		self deny: merge hasConflicts;
			assert: #('a' 'b' 'c') equals: (merge result artifacts asArray collect: [:each | each path]).
		^ self].
	merge := SquotLoadOrderMerge into: #('a' 'b' 'c') merge: #('a' 'b' 'c') basedOn: #('a' 'b' 'c').
	left := SquotArtifactMock path: 'b'.
	right := left copy.
	left whenContentComparedWith: right return: [SquotDiffMock new].
	merge applyDiff: (SquotArtifactModification left: left right: right).
	self deny: merge hasConflicts;
		assert: #('a' 'b' 'c') equals: (merge resolvedPatch applyTo: #('a' 'b' 'c')).