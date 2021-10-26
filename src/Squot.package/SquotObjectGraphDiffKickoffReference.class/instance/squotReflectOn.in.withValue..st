patching
squotReflectOn: aGraph in: aMirror withValue: targetObject
	"Nothing to do."
	self assert: (aGraph includes: targetObject).
	^ targetObject