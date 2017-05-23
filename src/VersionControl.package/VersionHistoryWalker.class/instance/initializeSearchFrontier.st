initialize-release
initializeSearchFrontier
	"Subclasses may override this to specifiy another iteration order.
	For example, you can use a Heap to order the versions by timestamp."
	searchFrontier := OrderedCollection new. "results in a breadth-first search"