private creating new versions
cacheNewMonticelloVersion: aPackageInfoDiff message: messageText
	| folderName packageName mcWorkingCopy patch version mcSnapshot |
	folderName := aPackageInfoDiff path squotPathSegments last.
	packageName := folderName allButLast: '.package' size.
	self flag: #FIXME. "this does not work for 'branched' packages"
	[mcWorkingCopy := MCWorkingCopy forPackageNamed: packageName]
		on: NotFound do: [^ self].
	patch := aPackageInfoDiff diffOfTrackedObject asMonticelloPatch.
	patch isEmpty ifTrue: [^ self].
	mcSnapshot := aPackageInfoDiff right shadowOfTrackedObject asMCSnapshot.
	version := mcWorkingCopy
		newVersionWithName: mcWorkingCopy uniqueVersionName
		message: messageText asString
		snapshot: mcSnapshot.
	"version is automatically stored in the cache upon construction"
	Transcript nextPutAll: 'automatically created from Squot save: ';
		show: version info name; cr.