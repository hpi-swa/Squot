toolbuilder
buildChangePane
	| builder |
	builder := ToolBuilder default.
	^ {builder build: (self buildChangePart: builder)}