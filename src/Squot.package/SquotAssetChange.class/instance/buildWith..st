toolbuilder
buildWith: builder
	^ SquotGUIUtilities buildVerticalLayout: {
		{
			(self pathString, String lf, 'Old:') -> #buildFrom.
			'New:' -> #buildTo.
		} gather: [:each | {
			SquotGUIUtilities buildShrinkWrapText: each key with: builder.
			self buildDynamicVersion: each value with: builder.
		}].
		self buildWorkspace: builder.
	} with: builder