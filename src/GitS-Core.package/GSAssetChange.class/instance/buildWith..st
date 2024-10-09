toolbuilder
buildWith: builder
	^ GSGUIUtilities buildVerticalLayout: {
		{
			(self pathString, String lf, 'Old:') -> #buildFrom:.
			'New:' -> #buildTo:.
		} gather: [:each | {
			GSGUIUtilities buildShrinkWrapText: each key with: builder.
			self buildDynamicAsset: each value with: builder.
		}].
		self buildWorkspace: builder.
	} with: builder