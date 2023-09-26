toolbuilder
buildDynamicVersion: versionSelector
label: aString
resolveAction: resolveSelector
state: stateSelector
with: builder
	^ SquotGUIUtilities buildVerticalLayout: {
		SquotGUIUtilities buildShrinkWrapText: aString with: builder.
		self buildDynamicVersion: versionSelector with: builder.
		resolveSelector ifNotNil: [
			SquotGUIUtilities
				buildButtons:
					{self
						buildResolveButton: resolveSelector
						state: stateSelector
						with: builder}
				with: builder].
	} with: builder