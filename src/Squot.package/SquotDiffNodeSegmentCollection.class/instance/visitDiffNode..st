visiting
visitDiffNode: aDiffNode
	"collect into another collection next to visitedNodes because of the different collection type"
	collection add: aDiffNode.
	self enqueueAll: aDiffNode children.