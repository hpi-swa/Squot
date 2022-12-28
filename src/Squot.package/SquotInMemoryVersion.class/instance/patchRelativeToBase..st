comparing
patchRelativeToBase: anObjectContainer
	^ SquotToggles useNewApi
		ifTrue:
			[| baseSnapshot |
			baseSnapshot :=
				(anObjectContainer respondsTo: #parents)
					ifTrue: [self flag: #deprecated. "?" anObjectContainer "a version" snapshot]
					ifFalse: [SquotProjectSnapshot fromStore: anObjectContainer].
			baseSnapshot squotMergeWith: snapshot basedOn: baseSnapshot]
		ifFalse:
			[SquotPatch builder
				patchFrom: (anObjectContainer ifNil: [SquotSnapshot empty])
				to: self]