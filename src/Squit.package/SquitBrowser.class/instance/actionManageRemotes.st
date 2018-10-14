actions on working copies
actionManageRemotes
	| browser |
	self projectSelection ifNil: [^ self].
	browser := SquitRemotesBrowser new
		workingCopy: self projectSelection;
		yourself.
	ToolBuilder open: browser.