snapshot
lazySnapshot
	"Answer a snapshot that does not read artifacts until their content is requested"
	^ repository
		cachedSnapshotOf: self
		ifAbsentPut: [self captureLazySnapshot]