moving
uncheckedMoveTo: aPath in: aWorkingCopy
	| assetFile |
	assetFile := self loadAssetFileFromImage: aWorkingCopy.
	self
		materialize: nil in: aWorkingCopy;
		path: aPath;
		materialize: assetFile in: aWorkingCopy.
	aWorkingCopy changed: #mappers.