toolbuilder
commitListKey: aChar from: view
	| newSearchTerm |
	newSearchTerm := self searchTerm, aChar.
	self searchTerm: newSearchTerm
	