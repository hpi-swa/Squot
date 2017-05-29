comparing
patchRelativeToBase: objectContainer
	^ SquotPatchBuilder new
		patchFrom: (objectContainer ifNil: [SquotSnapshot empty])
		to: self