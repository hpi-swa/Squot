private
updateLastLoadedHistorianName
	"Because this meta historian depends on the image name, it must be updated after image saves"
	repository isAvailable ifFalse: [^ self].
	lastLoadedHistorian := repository metaHistorianForLastLoadedVersion
		version: self lastLoadedHistorian version;
		yourself.