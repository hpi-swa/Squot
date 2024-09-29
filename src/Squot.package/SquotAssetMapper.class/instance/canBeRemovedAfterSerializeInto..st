testing
canBeRemovedAfterSerializeInto: aFileSystem
	^ self canBeRemovedForAssetFile: (self loadAssetFileFrom: aFileSystem)