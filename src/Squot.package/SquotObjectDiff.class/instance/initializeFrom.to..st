initialize-release
initializeFrom: leftObjectShadow to: rightShadow
	originalClass := leftObjectShadow originalClass.
	newClass := rightShadow originalClass.
	slotChanges := Dictionary new.