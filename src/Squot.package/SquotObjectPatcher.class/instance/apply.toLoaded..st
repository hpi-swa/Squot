as yet unclassified
apply: aDiff toLoaded: anObject
	| patched |
	patched := aDiff squotApplyToLoaded: anObject with: self.
	patchedObjects at: anObject put: patched.
	"in contrast to patching shadows, usually anObject == patched holds"
	^ patched