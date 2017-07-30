testing
patchedFrom: original to: target
	| diff materializer patched shadowOfOriginal |
	shadowOfOriginal := capturer capture: original.
	diff := shadowOfOriginal squotDiffAgainst: (capturer capture: target).
	patched := patcher apply: diff toGraph: shadowOfOriginal mutableCopy.
	materializer := SquotShadowMaterializer new.
	^ materializer rematerialize: patched startShadow