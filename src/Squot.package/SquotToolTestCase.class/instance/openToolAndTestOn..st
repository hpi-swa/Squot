utilities
openToolAndTestOn: aPatch
	| view |
	view := self openToolOn: aPatch.
	[self assert: tool rootNodes notEmpty.
	self performUiTestsOnToolBuiltBy: toolBuilder]
		ensure: [self closeTool: view].