enumerating
addNewObject: anObject reachedVia: aReference
	walk
		add: {nil. anObject} 
		reachedVia: aReference.