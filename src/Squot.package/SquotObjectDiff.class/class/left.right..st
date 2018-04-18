instance creation
left: leftShadow right: rightShadow
	^ self new
		diff: leftShadow against: rightShadow;
		yourself