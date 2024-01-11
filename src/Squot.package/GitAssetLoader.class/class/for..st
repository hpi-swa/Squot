instance creation
for: aString
	^ GitStandaloneAssetLoader named: aString ifAbsent: [self forWorkingCopyNamed: aString]