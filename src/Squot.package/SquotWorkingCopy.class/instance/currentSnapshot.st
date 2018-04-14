private
currentSnapshot
	"See #withCurrentSnapshot:"
	^ snapshotBlock
		ifNil: [self lazySnapshot]
		ifNotNil: [snapshotBlock value]