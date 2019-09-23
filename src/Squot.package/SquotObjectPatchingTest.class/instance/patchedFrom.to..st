testing
patchedFrom: original to: target
	"In contrast to patch:to:, this does not modify the original object,
	but creates a patched copy instead."
	| diff materializer patched shadowOfOriginal |
	shadowOfOriginal := capturer captureGraph: original.
	objectRegistry assign: (objectRegistry nameOf: original) to: target.
	diff := shadowOfOriginal squotDiffAgainst: (capturer captureGraph: target).
	patched := patcher apply: diff toGraph: shadowOfOriginal mutableCopy.
	materializer := SquotShadowMaterializer new.
	^ materializedObject := materializer rematerializeGraph: patched