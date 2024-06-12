accessing
assetAt: aPath
	^ self assetsCache at: aPath ifAbsentPut: [self readAsset: aPath]