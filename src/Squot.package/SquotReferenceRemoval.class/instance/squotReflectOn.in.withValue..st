patching
squotReflectOn: ownerObject in: aMirror withValue: targetObject
	^ aMirror reflect: (reference copyWithTarget: targetObject) removeFrom: ownerObject