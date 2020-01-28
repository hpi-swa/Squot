private creating new versions
cacheNewMonticelloVersion: aPackageInfoDiff message: messageText
	| packageName mcWorkingCopy patch version mcSnapshot |
	packageName := aPackageInfoDiff object shadowOfTrackedObject packageName.
	self flag: #FIXME. "this does not work for 'branched' packages"
	[mcWorkingCopy := MCWorkingCopy forPackageNamed: packageName]
		on: NotFound do: [^ self].
	patch := aPackageInfoDiff asMonticelloPatch.
	patch isEmpty ifTrue: [^ self].
	mcSnapshot := aPackageInfoDiff right shadowOfTrackedObject asMCSnapshot.
	version := mcWorkingCopy
		newVersionWithName: mcWorkingCopy uniqueVersionName
		message: messageText asString
		snapshot: mcSnapshot.
	"version is automatically stored in the cache upon construction"
	Transcript nextPutAll: 'automatically created from Squot save: ';
		show: version info name; cr.