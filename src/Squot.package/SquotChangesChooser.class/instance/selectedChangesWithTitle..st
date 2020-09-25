public
selectedChangesWithTitle: titleString
	| builder |
	promise ifNil: [promise := Promise new].
	builder := ToolBuilder default.
	Project current addDeferredUIMessage:
		[view := builder open: self label: titleString.
		self resumeModalRequest. "will resolve the promise"].
	^ promise