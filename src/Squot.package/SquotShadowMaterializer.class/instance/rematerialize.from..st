converting
rematerialize: anObject from: aShadow
	| materializedObject |
	convertedObjects at: aShadow put: anObject.
	materializedObject := (aShadow materializeAs: anObject with: self)
		comeFullyUpOnReload: self.
	anObject becomeForward: materializedObject.
	^ anObject