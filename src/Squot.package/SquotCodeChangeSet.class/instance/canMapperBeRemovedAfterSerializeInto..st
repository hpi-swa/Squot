testing
canMapperBeRemovedAfterSerializeInto: aFileSystem
	^ self canBeRemovedForSnapshot: (self changedSnapshotForSerializeInto: aFileSystem)