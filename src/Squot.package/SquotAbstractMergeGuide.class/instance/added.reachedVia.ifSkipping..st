callbacks for objects
added: incomingObjectReflection reachedVia: aReference ifSkipping: skipBlock
	"Note that a new object was encountered in the incoming graph and from where it was reached. Evaluate the skipBlock if the new object should not be traversed further to discover more objects behind it."
	self subclassResponsibility