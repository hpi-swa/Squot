toolbuilder
buildChange
	| builder |
	builder := ToolBuilder default.
	^ {(builder build: (self buildChange: builder))
			layoutFrame: LayoutFrame fullFrame;
			yourself}