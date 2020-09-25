public
selectedChangesWithTitle: titleString
	| builder |
	promise ifNil: [promise := Promise new].
	builder := ToolBuilder default.
	Project current addDeferredUIMessage:
		[view := builder open: self label: titleString].
	^ promise