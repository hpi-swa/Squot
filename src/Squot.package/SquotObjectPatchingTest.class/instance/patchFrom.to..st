testing
patchFrom: original to: target
	| diff materializer patched shadowOfOriginal |
	shadowOfOriginal := capturer capture: original.
	diff := shadowOfOriginal squotDiffAgainst: (capturer capture: target).
	patched := diff squotApplyTo: shadowOfOriginal.
	materializer := SquotShadowMaterializer new.
	^ materializer rematerializeRoot: patched