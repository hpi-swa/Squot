reflection
references
	^ (1 to: (thisContext objectSize: value))
		collect: 	[:each | SquotIndexableField index: each]