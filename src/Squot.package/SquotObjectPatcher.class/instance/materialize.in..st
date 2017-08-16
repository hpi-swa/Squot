as yet unclassified
materialize: aShadow in: anObject
	| materializedObject |
	materializedObject := aShadow materializeAs: anObject undecorated with: self.
	patchedObjectGraph addShadow: aShadow of: materializedObject.
	^ materializedObject