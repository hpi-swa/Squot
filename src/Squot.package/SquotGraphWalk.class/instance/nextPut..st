accessing
nextPut: anObject 
	"Remember to visit the given object during the walk"
	toBeVisited add: anObject.