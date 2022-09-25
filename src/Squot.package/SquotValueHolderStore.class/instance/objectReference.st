reflection
objectReference
	^ SquotBoundReference owner: holder mirror: holder class squotMirror
		reference: (SquotInstanceVariable named: 'contents')