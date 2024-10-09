toolbuilder
buildAsset: builder
	^ self selectedMapper
		buildAssetFromImage: self activeWorkingCopy
		with: builder