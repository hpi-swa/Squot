reflection
nextReflection: aReference
	^ SquotObjectReflection object: (self reflect: aReference) mirror: (self nextMirror: aReference)