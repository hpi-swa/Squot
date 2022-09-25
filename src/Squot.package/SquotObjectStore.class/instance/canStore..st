testing
canStore: anArtifact
	"Answer whether I, as an existing instance of this kind of store, can store the given artifact in addition to any other artifacts that I may already store."
	self subclassResponsibility