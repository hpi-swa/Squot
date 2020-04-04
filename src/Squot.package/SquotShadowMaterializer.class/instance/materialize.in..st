converting
materialize: aShadow in: anObject
	| materializedObject |
	convertedObjects at: aShadow undecorated put: anObject.
	(anObject shouldHaveNameAssignedBySquot and: [sourceGraph notNil]) ifTrue:
		[objectRegistry nameOf: anObject ifAbsentAssign: [sourceGraph nameOf: aShadow undecorated]].
	materializedObject := (aShadow materializeAs: anObject with: self)
		squotReactivateWith: self.
	self haltIf: (anObject ~~ materializedObject
		and: [thisContext sender method ~~ (SquotObjectShadow >> #squotMaterializeWith:)
		and: [anObject class isWeak not]]).
	anObject ~~ materializedObject ifTrue:
		"E. g. if anObject is a DiskProxy."
		[anObject becomeForward: materializedObject copyHash: false].
	^ anObject