accessing
snapshot
	"Answer a snapshot of my project with me as the backing store to retrieve storage for artifacts."
	self flag: #todo. "Mixed meaning: workingCopy snapshot really snapshots artifacts, while this implementation here only snapshots artifacts lazily."
	^ SquotProjectSnapshot fromStore: self