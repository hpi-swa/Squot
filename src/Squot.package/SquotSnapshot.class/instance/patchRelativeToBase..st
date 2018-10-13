comparing
patchRelativeToBase: objectContainer
	^ SquotPatch builder
		patchFrom: (objectContainer ifNil: [SquotSnapshot empty])
		to: self