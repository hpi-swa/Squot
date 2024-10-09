migrations
migrateMaterializedIn: aWorkingCopy
	| assetFile |
	assetFile := self loadAssetFileFromImage: aWorkingCopy.
	assetFile := self migrateMaterialized: assetFile.
	self materialize: assetFile in: aWorkingCopy.
	