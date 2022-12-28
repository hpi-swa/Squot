callbacks for references
reached: workingCopyObjectReflection at: pathCollection
	"Note that the object was encountered at the given path into the graph, even though that reference was not changed in the incoming graph, so it still refers to the same object."
	self subclassResponsibility