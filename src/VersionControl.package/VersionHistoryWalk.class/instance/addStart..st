history walking
addStart: aVersion
	sourceVersions add: aVersion.
	^ searchFrontier add:
		(self marked: aVersion)
			markReachableFromSource;
			yourself