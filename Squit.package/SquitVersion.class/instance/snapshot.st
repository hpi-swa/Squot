Pur version
snapshot
	"returns a snapshot"
	self flag: #metamodel.
	^ repository gitRepository filesystemOn: commit