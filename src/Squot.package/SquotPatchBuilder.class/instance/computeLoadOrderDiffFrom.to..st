private
computeLoadOrderDiffFrom: leftObjectContainer to: rightObjectContainer
	originalLoadOrder := leftObjectContainer loadOrder.
	patchedLoadOrder := rightObjectContainer loadOrder.
	^ self computeLoadOrderDiff