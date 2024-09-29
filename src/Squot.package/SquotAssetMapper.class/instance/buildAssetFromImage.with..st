toolbuilder
buildAssetFromImage: aWorkingCopy with: builder
	^ self
		buildAsset: (self loadAssetFromImage: aWorkingCopy)
		with: builder