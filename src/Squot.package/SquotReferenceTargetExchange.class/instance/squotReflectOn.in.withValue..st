patching
squotReflectOn: ownerObject in: aMirror withValue: targetObject
	^ aMirror reflect: reference of: ownerObject put: targetObject