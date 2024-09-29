testing
canMapperBeRemovedAtAll
	^ self isIncluded and: [self mapper canBeRemovedForAssetFile: self assetFileToWrite]