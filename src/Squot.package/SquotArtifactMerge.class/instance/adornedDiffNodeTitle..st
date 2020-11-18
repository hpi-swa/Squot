*Squot-Tools
adornedDiffNodeTitle: aString
	^ self workingIsLoaded
		ifTrue: [aString, ' (merge)']
		ifFalse:
			[self willBeLoaded
				ifTrue: ['load ', aString, ' (merge, currently unloaded)']
				ifFalse: [aString, ' (merge, not loaded)']]