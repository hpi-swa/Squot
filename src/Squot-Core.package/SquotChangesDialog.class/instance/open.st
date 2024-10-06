toolbuilder
open
	| opened |
	opened := ToolBuilder open: self.
	self changed: #expandRootsRequested.
	^ opened