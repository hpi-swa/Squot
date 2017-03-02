private creating new versions
cacheNewMonticelloVersion: aPackageInfoArtifact message: messageText
	| folderName packageName mcWorkingCopy patch |
	folderName := (aPackageInfoArtifact path copyAfterLast: $/) ifEmpty: aPackageInfoArtifact path.
	packageName := folderName allButLast: '.package' size.
	[mcWorkingCopy := MCWorkingCopy forPackageNamed: packageName]
		on: NotFound do: [^ self].
	(patch := aPackageInfoArtifact content
		patchRelativeToBase: (self cachedMCBaseVersionOf: mcWorkingCopy) snapshot)
		isEmpty ifTrue: ["no changes to this package" ^ self].
	[| version | version := mcWorkingCopy newVersion.
	Transcript nextPutAll: 'automatically created from Squot save: ';
		show: version info name; cr]
		on: MCVersionNameAndMessageRequest
		do: [:request | self answer: request toApply: patch message: messageText workingCopy: mcWorkingCopy]
		on: MCRepositoryRequest
		do: [:request | request resume: MCCacheRepository default]