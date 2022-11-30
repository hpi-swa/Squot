Squot-diff-patching
squotApplyTo: aPackageShadow
	"Apply my changes to aPackageShadow and answer the result."
	^ aPackageShadow
		copyWithSnapshot: (patch squotApplyTo: aPackageShadow asMCSnapshot)
		tonelProperties: incoming tonelProperties