comparing
patchRelativeToBase: anObjectContainer
	^ SquotPatch builder
		patchFrom: (anObjectContainer ifNil: [SquotSnapshot empty])
		to: self