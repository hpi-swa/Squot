initialize-release
diff: leftObjectShadow against: rightShadow with: aDiffBuilder
	originalClass := leftObjectShadow originalClass.
	newClass := rightShadow originalClass.
	slotChanges := Dictionary new.