patching
squotReflectOn: ownerObject in: aMirror withValue: targetObject
	"Do not actually change anything, only my subclasses do that."
	^ targetObject