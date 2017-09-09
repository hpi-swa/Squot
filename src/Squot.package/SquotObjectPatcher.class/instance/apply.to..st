as yet unclassified
apply: aDiff to: aShadow
	| patched |
	patched := aDiff squotApplyTo: aShadow with: self.
	patchedObjects at: aShadow put: patched.
	patchedObjectGraph assign: (patchedObjectGraph nameOf: aShadow undecorated) toShadow: patched undecorated.
	^ patched