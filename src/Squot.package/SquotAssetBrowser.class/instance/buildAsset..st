toolbuilder
buildAsset: builder
	^ self selectedMapper
		ifNil: [self buildNoAssetSelected: builder]
		ifNotNil: [:mapper |
			mapper
				buildVersionFromImage: self activeWorkingCopy
				with: builder]