instance creation
model: anObject
mapper: anAssetMapper
setAsset: setAssetSelector
getBindings: getBindingsSelector
editTargetName: aString
buildWith: builder
	^ self new
		model: anObject;
		mapper: anAssetMapper;
		setAssetSelector: setAssetSelector;
		getBindingsSelector: getBindingsSelector;
		editTargetName: aString;
		setup;
		buildWith: builder