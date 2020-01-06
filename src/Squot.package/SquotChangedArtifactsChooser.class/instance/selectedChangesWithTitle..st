public
selectedChangesWithTitle: titleString
	| builder |
	builder := ToolBuilder default.
	view := builder open: self label: titleString.
	promise ifNil: [promise := Promise new].
	self future resumeModalRequest. "will resolve the promise"
	^ promise