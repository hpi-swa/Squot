comparing
containsReference: aReference
	^  aReference filesystem = filesystem and: [path contains: aReference path]