testing
areAllChildrenActive
	self flag: #stub. "consider graphs with cycles!"
	^ self withAllChildren allSatisfy: [:each | each isActive]