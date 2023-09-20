toolbuilder
buildAsset: builder
	^ self selectedMapper
		buildVersionFromImage: self activeWorkingCopy
		with: builder