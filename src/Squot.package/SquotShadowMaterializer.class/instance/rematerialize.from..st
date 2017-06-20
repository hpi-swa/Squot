converting
rematerialize: anObject from: aMetaobject
	| materializedObject |
	convertedObjects at: aMetaobject put: anObject.
	materializedObject := (aMetaobject materializeAs: anObject with: self)
		comeFullyUpOnReload: self.
	anObject becomeForward: materializedObject.
	^ anObject