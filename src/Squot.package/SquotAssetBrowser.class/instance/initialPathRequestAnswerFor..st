requests
initialPathRequestAnswerFor: anAssetMapperClass
	^ SquotPathUtilities asString:
		self commonPathPrefix / (self defaultFileNameFor: anAssetMapperClass)