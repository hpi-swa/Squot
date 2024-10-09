toolbuilder
buildBody: builder
	^ GSPreferences showBase
		ifTrue: [self buildBodyWithBase: builder]
		ifFalse: [self buildBodyWithoutBase: builder]