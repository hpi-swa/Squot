toolbuilder
buildAutoSaveNote: builder
	^ GSGUIUtilities
		buildShrinkWrapText: (GSTextUtilities italic: 'Changes are saved automatically.')
		with: builder