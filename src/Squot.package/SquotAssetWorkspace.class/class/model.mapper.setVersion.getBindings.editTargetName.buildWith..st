instance creation
model: anObject
mapper: anAssetMapper
setVersion: setVersionSelector
getBindings: getBindingsSelector
editTargetName: aString
buildWith: builder
	^ self new
		model: anObject;
		mapper: anAssetMapper;
		setVersionSelector: setVersionSelector;
		getBindingsSelector: getBindingsSelector;
		editTargetName: aString;
		setup;
		buildWith: builder