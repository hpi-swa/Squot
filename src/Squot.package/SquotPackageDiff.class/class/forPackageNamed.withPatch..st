instance creation
forPackageNamed: aString withPatch: aMCPatchOrMergeDiff
	^ self new
		packageName: aString patch: aMCPatchOrMergeDiff;
		yourself