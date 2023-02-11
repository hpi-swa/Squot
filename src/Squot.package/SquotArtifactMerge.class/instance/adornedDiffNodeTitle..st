*Squot-Tools
adornedDiffNodeTitle: aString
	^ self workingIsLoaded
		ifTrue: [aString, ' (merge)']
		ifFalse:
			[SquotToggles useNewApi
				ifTrue:
					[self flag: #todo. "Load status is now determined by the kind of store into which the object gets put. Unloaded means that it is just a snapshot store."
					aString]
				ifFalse:
					[self willBeLoaded
						ifTrue: ['load ', aString, ' (merge, currently unloaded)']
						ifFalse: [aString, ' (merge, not loaded)']]]