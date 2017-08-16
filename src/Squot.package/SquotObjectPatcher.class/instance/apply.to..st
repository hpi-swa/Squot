as yet unclassified
apply: aDiff to: aShadow
	| patched |
	patched := aDiff squotApplyTo: aShadow with: self.
	patchedObjects at: aShadow put: patched.
	^ patched