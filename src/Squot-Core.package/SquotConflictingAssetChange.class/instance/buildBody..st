toolbuilder
buildBody: builder
	^ SquotPreferences showBase
		ifTrue: [self buildBodyWithBase: builder]
		ifFalse: [self buildBodyWithoutBase: builder]