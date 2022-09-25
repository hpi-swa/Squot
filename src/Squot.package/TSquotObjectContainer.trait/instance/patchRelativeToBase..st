comparing
patchRelativeToBase: anObjectContainer
	^ SquotToggles useNewApi
		ifTrue:
			[| baseSnapshot |
			baseSnapshot := SquotProjectSnapshot fromStore: anObjectContainer.
			SquotProjectMergeFactory new
				merge: (SquotProjectSnapshot fromStore: self)
				into: baseSnapshot
				basedOn: baseSnapshot]
		ifFalse:
			[SquotPatch builder
				patchFrom: (anObjectContainer ifNil: [SquotSnapshot empty])
				to: self]