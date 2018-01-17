visiting
visit: aDiffNode
	visitedNodes add: aDiffNode.
	^ aDiffNode accept: self