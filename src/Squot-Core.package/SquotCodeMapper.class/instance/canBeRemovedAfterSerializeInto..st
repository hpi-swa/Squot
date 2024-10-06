testing
canBeRemovedAfterSerializeInto: aFileSystem
	^ self canBeRemovedForSnapshot: (self loadSnapshotFrom: aFileSystem)