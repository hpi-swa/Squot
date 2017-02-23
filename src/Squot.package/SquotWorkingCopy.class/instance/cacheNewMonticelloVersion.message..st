private creating new versions
cacheNewMonticelloVersion: aPackageInfoArtifact message: messageText
	| folderName packageName mcWorkingCopy |
	folderName := (aPackageInfoArtifact path copyAfterLast: $/) ifEmpty: aPackageInfoArtifact path.
	packageName := folderName allButLast: '.package' size.
	[mcWorkingCopy := MCWorkingCopy forPackageNamed: packageName]
		on: NotFound do: [^ self].
	(aPackageInfoArtifact content
		patchRelativeToBase: (self cachedMCBaseVersionOf: mcWorkingCopy) snapshot)
		operations isEmpty ifTrue: ["no changes to this package" ^ self].
	[mcWorkingCopy newVersion]
		on: MCVersionNameAndMessageRequest
		do: [:request | self answer: request toApproximate: aPackageInfoArtifact message: messageText workingCopy: mcWorkingCopy]
		on: MCRepositoryRequest
		do: [:request | request resume: MCCacheRepository default]