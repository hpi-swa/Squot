utilities
openToolAndTestOnPatch: aPatch
	| toolBuilder view |
	tool := self newToolOn: aPatch.
	toolBuilder := ToolBuilder default.
	view := toolBuilder open: tool label: self selector.
	[self assert: tool rootNodes notEmpty.
	self performUiTestsOnToolBuiltBy: toolBuilder]
	ensure: [toolBuilder close: view].