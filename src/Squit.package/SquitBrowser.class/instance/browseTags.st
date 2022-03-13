actions on working copies
browseTags
	self hasProjectSelection ifFalse: [^ self].
	ToolBuilder default open: (SquitTagsBrowser repository: self projectSelection repository).