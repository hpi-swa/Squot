Squot-diff-patching
applyToShadowNamed: name inGraph: anObjectGraph
	| patched |
	patched := self squotApplyTo: (anObjectGraph shadowNamed: name).
	anObjectGraph assign: name toShadow: patched undecorated.
	^ patched