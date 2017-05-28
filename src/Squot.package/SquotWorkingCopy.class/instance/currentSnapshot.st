private
currentSnapshot
	^ snapshotBlock
		ifNil: [store captureSnapshot]
		ifNotNil: [snapshotBlock value]