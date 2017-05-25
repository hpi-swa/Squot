history walking
addStart: aVersion
	^ searchFrontier add:
		(self marked: aVersion)
			markReachableFromSource;
			yourself