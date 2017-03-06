private creating new versions
cacheNewMonticelloVersion: aPackageInfoArtifact message: messageText
	| folderName packageName mcWorkingCopy patch version |
	folderName := (aPackageInfoArtifact path copyAfterLast: $/) ifEmpty: aPackageInfoArtifact path.
	packageName := folderName allButLast: '.package' size.
	[mcWorkingCopy := MCWorkingCopy forPackageNamed: packageName]
		on: NotFound do: [^ self].
	(patch := aPackageInfoArtifact content
		patchRelativeToBase: (self cachedMCAncestorSnapshotOf: mcWorkingCopy))
		isEmpty ifTrue: ["no changes to this package" ^ self].
	version := mcWorkingCopy
		newVersionWithName: mcWorkingCopy uniqueVersionName
		message: messageText asString
		snapshot: aPackageInfoArtifact content.
	"version is automatically stored in the cache upon construction"
	Transcript nextPutAll: 'automatically created from Squot save: ';
		show: version info name; cr.