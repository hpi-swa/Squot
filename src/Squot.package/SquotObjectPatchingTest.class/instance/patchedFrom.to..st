testing
patchedFrom: original to: target
	| diff materializer patched shadowOfOriginal |
	shadowOfOriginal := capturer capture: original.
	diff := shadowOfOriginal squotDiffAgainst: (capturer capture: target).
	patched := patcher apply: diff to: shadowOfOriginal.
	materializer := SquotShadowMaterializer new.
	^ materializer rematerialize: patched