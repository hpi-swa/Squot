toolbuilder
buildLayout: builder
	self hasButtons ifFalse: [^ self buildMainLayout: builder].
	^ GSGUIUtilities buildVerticalLayout: {
		self buildMainLayout: builder.
		self buildButtons: builder.
	} with: builder