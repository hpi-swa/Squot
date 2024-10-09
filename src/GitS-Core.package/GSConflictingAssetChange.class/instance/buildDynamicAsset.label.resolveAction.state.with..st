toolbuilder
buildDynamicAsset: assetSelector
label: aString
resolveAction: resolveSelector
state: stateSelector
with: builder
	^ GSGUIUtilities buildVerticalLayout: {
		GSGUIUtilities buildShrinkWrapText: aString with: builder.
		self buildDynamicAsset: assetSelector with: builder.
		resolveSelector ifNotNil: [
			GSGUIUtilities
				buildButtons:
					{self
						buildResolveButton: resolveSelector
						state: stateSelector
						with: builder}
				with: builder].
	} with: builder