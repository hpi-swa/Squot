toolbuilder
buildLayout: builder
	self hasButtons ifFalse: [^ self buildMainLayout: builder].
	^ SquotGUIUtilities buildVerticalLayout: {
		self buildMainLayout: builder.
		self buildButtons: builder.
	} with: builder