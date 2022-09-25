comparing
patchRelativeToBase: anObjectContainer
	^ SquotToggles useNewApi
		ifTrue:
			[| baseSnapshot |
			baseSnapshot :=
				(anObjectContainer respondsTo: #parents)
					ifTrue: [self flag: #deprecated. "?" anObjectContainer "a version" snapshot]
					ifFalse: [SquotProjectSnapshot fromStore: anObjectContainer].
			SquotProjectMergeFactory new
				merge: snapshot
				into: baseSnapshot
				basedOn: baseSnapshot]
		ifFalse:
			[SquotPatch builder
				patchFrom: (anObjectContainer ifNil: [SquotSnapshot empty])
				to: self]