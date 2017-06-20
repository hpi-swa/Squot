instance creation
left: leftObjectShadow right: rightShadow with: aDiffBuilder
	^ self new
		diff: leftObjectShadow against: rightShadow with: aDiffBuilder;
		yourself