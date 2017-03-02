private creating new versions
answer: aMCVersionNameAndMessageRequest toApply: aMCPatch message: messageText workingCopy: mcWorkingCopy
	| allOperations ignored versionName wantedOperations |
	allOperations := aMCVersionNameAndMessageRequest patchBlock value operations.
	wantedOperations := aMCPatch operations.
	ignored := allOperations difference: wantedOperations.
	versionName := mcWorkingCopy uniqueVersionName.
	aMCVersionNameAndMessageRequest resume: {versionName. messageText asString. ignored}.