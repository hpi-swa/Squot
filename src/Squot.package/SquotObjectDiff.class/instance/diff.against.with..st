initialize-release
diff: leftObjectShadow against: rightShadow with: aDiffBuilder
	self deprecated: 'Use initializeFrom:to: instead'.
	originalClass := leftObjectShadow originalClass.
	newClass := rightShadow originalClass.
	slotChanges := Dictionary new.