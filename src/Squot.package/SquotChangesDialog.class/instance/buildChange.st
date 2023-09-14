toolbuilder
buildChange
	| builder |
	builder := ToolBuilder default.
	^ {builder build: (self buildChange: builder)}