toolbuilder
buildBody: builder
	^ SquotGUIUtilities buildEvenGrid: {
		{
			{#buildBase:. 'Base:'. #resolveToBase}.
			{#buildLeft:. 'Current:'. #resolveToLeft}.
			{#buildRight:. 'Incoming:'. #resolveToRight}
		} collect: [:each |
			self
				buildDynamicVersion: each first
				label: each second
				resolveAction: each third
				with: builder].
		self buildResolutionPanel: builder.
	} ofSize: 2 @ 2 with: builder