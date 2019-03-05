artifact locating
locateArtifactsForClass: aClass in: aDirectory
	"If a subclass knows how to find artifacts that capture objects of the given kind,
	it should perform its search and answer a collection of FileSystem references to the found
	locations. If the given kind is unknown or unsupported, answer an empty collection."
	self subclassResponsibility.
	^ #()