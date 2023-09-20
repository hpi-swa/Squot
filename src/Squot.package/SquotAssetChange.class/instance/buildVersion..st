toolbuilder
buildVersion: anObject
	| builder spec |
	builder := ToolBuilder default.
	spec := self buildVersion: anObject with: builder.
	^ {(builder build: spec)
			layoutFrame: LayoutFrame fullFrame;
			yourself}