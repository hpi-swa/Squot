toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: ({
		'Resolve to base' -> #resolveToBase.
		'Resolve to current' -> #resolveToLeft.
		'Resolve to incoming' -> #resolveToRight.
		'Reset to conflict' -> #resetToConflict.
		#editButtonLabel -> #toggleEditMode.
	} collect: [:each | self buildActionButton: builder label: each key action: each value])
		with: builder