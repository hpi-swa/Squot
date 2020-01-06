public
requestSelectedChangesWithTitle: titleString
	| builder |
	builder := ToolBuilder default.
	view := builder open: self label: titleString.
	builder runModal: view.