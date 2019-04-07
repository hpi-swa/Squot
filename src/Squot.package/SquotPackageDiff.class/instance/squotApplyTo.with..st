Squot-diff-patching
squotApplyTo: aPackageShadow with: aPatcher
	^ (self squotApplyTo: aPackageShadow) "do not need the help of aPatcher"
		withSquotObjectName: (aPatcher nameOf: aPackageShadow undecorated)