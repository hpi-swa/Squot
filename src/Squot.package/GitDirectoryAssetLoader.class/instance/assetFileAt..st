accessing
assetFileAt: aPath
	^ self assetFilesCache at: aPath ifAbsentPut: [self readAssetFile: aPath]