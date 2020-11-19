comparing
patchRelativeToBase: aVersion
	^ SquotPatch builder
		patchFrom: (aVersion ifNil: [SquotSnapshot empty])
		to: self