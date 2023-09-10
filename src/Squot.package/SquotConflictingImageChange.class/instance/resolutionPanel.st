toolbuilder
resolutionPanel
	| builder spec panel |
	builder := ToolBuilder default.
	spec := builder pluggablePanelSpec new
		children: {
			self buildText: 'Resolution:' with: builder.
			self buildVersion: self resolution with: builder.
		};
		frame: LayoutFrame fullFrame;
		yourself.
	panel := builder build: spec.
	self flag: #todo.
	"setting the table layout immediately causes an assertion failure in panel doLayoutIn:,
	so delay setting it until after the first layout pass has completed"
	[panel
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom] future value.
	^ {panel}