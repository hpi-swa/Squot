importing
importMapper: aMapper fromStream: aStream
	| assetFile |
	assetFile := SquotAssetFile withMapper: aMapper fromStream: aStream.
	self activeWorkingCopy addMapper: aMapper.
	aMapper materialize: assetFile in: self activeWorkingCopy.
	self selectedMapper: aMapper.