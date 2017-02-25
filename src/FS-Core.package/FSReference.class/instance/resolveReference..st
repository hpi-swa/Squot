resolving
resolveReference: aReference
	
	^ (filesystem = aReference filesystem or: [aReference isRelative])
		ifTrue: [filesystem referenceTo: (path resolvePath: aReference path)]
		ifFalse: [aReference]