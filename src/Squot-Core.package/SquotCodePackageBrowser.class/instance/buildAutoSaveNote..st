toolbuilder
buildAutoSaveNote: builder
	^ SquotGUIUtilities
		buildShrinkWrapText: (SquotTextUtilities italic: 'Changes are saved automatically.')
		with: builder