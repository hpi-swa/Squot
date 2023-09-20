toolbuilder
buildAssetPanel: builder
	^ self selectedMapper
		ifNil: [self buildNoAssetSelected: builder]
		ifNotNil: [:mapper | self buildAssetPanelLayout: builder]