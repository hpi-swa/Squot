toolbuilder
buildBody: builder
	^ SquotGUIUtilities buildEvenGrid: {
		{
			{#buildBase:. 'Base:'. #resolveToBase. #isResolvedToBase}.
			{#buildLeft:. 'Current:'. #resolveToLeft. #isResolvedToLeft}.
			{#buildRight:. 'Incoming:'. #resolveToRight. #isResolvedToRight}
		} collect: [:each |
			self
				buildDynamicVersion: each first
				label: each second
				resolveAction: each third
				state: each fourth
				with: builder].
		self buildResolutionPanel: builder.
	} ofSize: 2 @ 2 with: builder