as yet unclassified
apply: aDiff to: aShadow
	| patched |
	patchedObjects at: aShadow undecorated ifPresent: [:it | ^ it].
	patched := aDiff squotApplyTo: aShadow with: self.
	patchedObjects at: aShadow undecorated put: patched.
	self addToGraph: patched.
	^ patched