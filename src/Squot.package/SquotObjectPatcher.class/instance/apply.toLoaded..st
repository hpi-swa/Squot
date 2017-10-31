as yet unclassified
apply: aDiff toLoaded: anObject
	| patched |
	patchedObjects at: anObject ifPresent: [:it | ^ it].
	patched := aDiff squotApplyToLoaded: anObject with: self.
	patchedObjects at: anObject put: patched.
	"in contrast to patching shadows, anObject == patched holds in most cases"
	^ patched