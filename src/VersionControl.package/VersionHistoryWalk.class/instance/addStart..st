history walking
addStart: aVersion
	aVersion ifNil: [self error: 'Undefined version'].
	sourceVersions add: aVersion.
	^ searchFrontier add:
		(self marked: aVersion)
			markReachableFromSource;
			yourself