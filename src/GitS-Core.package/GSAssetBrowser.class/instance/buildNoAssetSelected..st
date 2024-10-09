toolbuilder
buildNoAssetSelected: builder
	^ GSGUIUtilities
		buildText: (GSTextUtilities italic: 'No asset selected.')
		with: builder