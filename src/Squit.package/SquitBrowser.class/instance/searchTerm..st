ui
searchTerm: anObject
	searchTerm := anObject asString.
	self changed: #searchTerm.
	self changed: #hasSearchTerm.
	self withUnitOfWork: [self changed: #commitList].