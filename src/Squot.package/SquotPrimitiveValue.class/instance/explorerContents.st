*Squot-Tools
explorerContents
	^ self class = SquotPrimitiveValue
		ifTrue: [value explorerContents]
		ifFalse: [super explorerContents]