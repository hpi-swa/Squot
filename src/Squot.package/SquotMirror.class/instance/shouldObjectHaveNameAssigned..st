testing
shouldObjectHaveNameAssigned: anObject
	"Answer whether the object should get a name (an identifier) in order to be able to find it later and different versions of it in other object graphs. For value objects it should answer false. For entities it should answer true."
	^ self subclassResponsibility