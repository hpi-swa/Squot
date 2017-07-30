testing
patchedFrom: original to: target
	| diff materializer patched shadowOfOriginal |
	shadowOfOriginal := capturer captureGraph: original.
	diff := shadowOfOriginal squotDiffAgainst: (capturer captureGraph: target).
	patched := patcher apply: diff toGraph: shadowOfOriginal mutableCopy.
	materializer := SquotShadowMaterializer new.
	^ materializer rematerialize: patched startShadow