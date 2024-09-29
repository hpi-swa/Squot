testing
canBeRemovedAfterMaterializeIn: aWorkingCopy
	^ self canBeRemovedForAssetFile: (self loadAssetFileFromImage: aWorkingCopy)