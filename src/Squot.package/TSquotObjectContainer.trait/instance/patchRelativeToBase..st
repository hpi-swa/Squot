comparing
patchRelativeToBase: anObjectContainer
	^ SquotToggles useNewApi
		ifTrue:
			[| baseSnapshot |
			baseSnapshot := SquotProjectSnapshot fromStore: anObjectContainer.
			baseSnapshot squotMergeWith: self basedOn: baseSnapshot]
		ifFalse:
			[SquotPatch builder
				patchFrom: (anObjectContainer ifNil: [SquotSnapshot empty])
				to: self]