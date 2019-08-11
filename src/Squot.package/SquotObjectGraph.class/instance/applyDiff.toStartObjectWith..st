patching
applyDiff: aDiff toStartObjectWith: aPatcher
	| oldStartObject newStartObject patchedShadow |
	"To handle the case that the start object is exchanged,
	try to retrieve the new name and update the start name."
	oldStartObject := self startObject.
	newStartObject := aPatcher apply: aDiff toLoaded: oldStartObject.
	patchedShadow := aPatcher shadowOf: newStartObject.
	startName := aPatcher nameOf: patchedShadow ifAbsent: [SquotObjectCapturer new rootName].
	self assign: startName to: newStartObject.
	^ newStartObject