initialize-release
initializeSearchFrontier
	"Subclasses may override this to specify another iteration order."
	searchFrontier := Heap sortBlock: [:a :b | self shouldVisit: a before: b].