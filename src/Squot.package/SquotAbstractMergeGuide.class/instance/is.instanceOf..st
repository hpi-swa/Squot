callbacks for objects
is: anObject instanceOf: anotherObject
	"Answer whether the two objects are snapshots of the same object (possibly taken at different times)."
	self flag: #todo. "Should the sender ask the mirror of these objects instead?"
	self subclassResponsibility