patching
squotReflectOn: ownerObject in: aMirror withValue: targetObject
	"Apply the difference to anObject via its mirror, using targetObject as the new value."
	self subclassResponsibility.