as yet unclassified
apply: aDiff to: aShadow
	| patched |
	patchedObjects at: aShadow undecorated ifPresent: [:it | ^ it].
	patched := aDiff squotApplyTo: aShadow with: self.
	patchedObjects at: aShadow undecorated put: patched.
	(patched hasSquotShadowName and: [patched name ~= (patchedObjectGraph nameOf: aShadow undecorated)])
		ifTrue: [patchedObjectGraph
				assign: patched name
				toShadow: patched undecorated].
	^ patched