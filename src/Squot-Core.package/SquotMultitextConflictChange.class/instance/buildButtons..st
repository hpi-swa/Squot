toolbuilder
buildButtons: builder
	^ SquotGUIUtilities buildButtons: 
		((SquotPreferences showBase
			ifTrue: [{{'Resolve to base'. #resolveToBase. #isResolvedToBase}}]
			ifFalse: [{}]), {
		{'Resolve to current'. #resolveToLeft. #isResolvedToLeft}.
		{'Resolve to incoming'. #resolveToRight. #isResolvedToRight}.
		{'Reset to conflict'. #resetToConflict. nil}.
		{#editButtonLabel. #toggleEditMode. nil}.
	} collect: [:each |
		self buildActionButton: builder
			label: each first
			action: each second
			state: each third])
		with: builder