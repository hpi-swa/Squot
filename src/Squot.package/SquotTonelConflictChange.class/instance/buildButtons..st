toolbuilder
buildButtons: builder
	^ builder pluggablePanelSpec new
		layout: #horizontal;
		children: ({
			'Resolve to base' -> #resolveToBase.
			'Resolve to current' -> #resolveToLeft.
			'Resolve to incoming' -> #resolveToRight.
			'Reset to conflict' -> #resetToConflict.
			#editButtonLabel -> #toggleEditMode.
		} collect: [:each | self buildActionButton: builder label: each key action: each value]);
		verticalResizing: #shrinkWrap;
		yourself