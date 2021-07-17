patching
squotReflectOn: aGraph in: aMirror withValue: targetObject
	"Update the startName of the graph."
	| answer |
	answer := super squotReflectOn: aGraph in: aMirror withValue: targetObject.
	aGraph startName: (aGraph nameOf: targetObject undecorated).
	^ answer