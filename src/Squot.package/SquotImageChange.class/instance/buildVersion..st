toolbuilder
buildVersion: aFormOrNil
	| builder spec |
	builder := ToolBuilder default.
	spec := self buildVersion: aFormOrNil with: builder.
	^ {(builder build: spec)
			layoutFrame: LayoutFrame fullFrame;
			yourself}