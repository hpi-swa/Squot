toolbuilder
buildDynamicVersion: aSelector label: aString resolveAction: anotherSelectorOrNil with: builder
	^ SquotGUIUtilities buildVerticalLayout: {
		SquotGUIUtilities buildShrinkWrapText: aString with: builder.
		self buildDynamicVersion: aSelector with: builder.
		anotherSelectorOrNil ifNotNil: [
			SquotGUIUtilities
				buildButtons: {self buildResolveButton: anotherSelectorOrNil with: builder}
				with: builder].
	} with: builder