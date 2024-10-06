toolbuilder
buildNoAssetSelected: builder
	^ SquotGUIUtilities
		buildText: (SquotTextUtilities italic: 'No asset selected.')
		with: builder