testing
canBeRemovedAfterMaterializeIn: aWorkingCopy
	^ self canBeRemovedForVersion: (self loadVersionFromImage: aWorkingCopy)