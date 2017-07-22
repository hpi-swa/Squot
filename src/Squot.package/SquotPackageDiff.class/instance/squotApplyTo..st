Squot-diff-patching
squotApplyTo: aPackageShadow
	"Apply my changes to aPackageShadow and answer the result."
	^ aPackageShadow withPackageDiffPatchApplied: patch