callbacks for objects
disappeared: incomingObjectReflection reachedVia: aReference ifSkipping: skipBlock
	"Note that an object was encountered in the incoming graph that was removed from the working copy, and from where it was reached. This is invoked only once per object. Evaluate the skipBlock if the new object should not be traversed further to discover more objects behind it."
	self subclassResponsibility