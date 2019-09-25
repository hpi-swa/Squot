private
currentSnapshot
	"See #withCurrentSnapshot:"
	^ SquotCurrentWorkingCopySnapshotBlock value
		ifNil: [self lazySnapshot]
		ifNotNil: [SquotCurrentWorkingCopySnapshotBlock value value]