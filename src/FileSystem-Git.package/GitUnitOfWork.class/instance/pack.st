maintaining
pack
	| packStore |
	packStore :=
		objectStores
			detect: [:each | each respondsTo: #pack]
			ifNone: [objectStores add: (GitPackedObjectStore on: repository)].
	packStore pack.