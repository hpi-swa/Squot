public
computeLoadOrderDiffFrom: leftObjectContainer to: rightObjectContainer
	^ GenericDiff squotDiffClass new
		file1: leftObjectContainer loadOrder;
		file2: rightObjectContainer loadOrder;
		diff