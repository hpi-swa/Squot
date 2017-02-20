creating new versions
answer: aMCVersionNameAndMessageRequest toApproximate: aPackageInfoArtifact message: messageText workingCopy: mcWorkingCopy
	| allOperations ignored versionName wantedOperations |
	allOperations := aMCVersionNameAndMessageRequest patchBlock value operations.
	wantedOperations := (aPackageInfoArtifact content
		patchRelativeToBase: (MCCacheRepository default versionWithInfo: mcWorkingCopy ancestors first) snapshot) operations.
	ignored := allOperations difference: wantedOperations.
	versionName := mcWorkingCopy uniqueVersionName.
	aMCVersionNameAndMessageRequest resume: {versionName. messageText asString. ignored}.