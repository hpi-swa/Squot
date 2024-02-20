testing
canMapperBeRemovedAfterMaterializeIn: aWorkingCopy
	^ self canBeRemovedForSnapshot: (self changedSnapshotForMaterializeIn: aWorkingCopy)