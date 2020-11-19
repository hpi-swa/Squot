*Squot-Tools
adornedDiffNodeTitle: aString
	^ isLoadedInWorkingCopy
		ifTrue: [super adornedDiffNodeTitle: aString]
		ifFalse:
			[self willBeLoaded
				ifTrue: ['load ', aString, ' (changed, currently unloaded)']
				ifFalse: [aString, ' (changed, not loaded)']]