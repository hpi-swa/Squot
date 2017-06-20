testing
patchFrom: original to: target
	| diff materializer patched shadowOfOriginal |
	shadowOfOriginal := original captureWithSquot.
	diff := shadowOfOriginal squotDiffAgainst: target captureWithSquot.
	patched := diff squotApplyTo: shadowOfOriginal.
	materializer := SquotShadowMaterializer new.
	^ materializer rematerializeRoot: patched