ui
searchTerm: anObject
	searchTerm := anObject asString.
	self changed: #searchTerm.
	self changed: #commitList