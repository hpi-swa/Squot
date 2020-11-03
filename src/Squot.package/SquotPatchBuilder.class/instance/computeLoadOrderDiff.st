private
computeLoadOrderDiff
	(loadOrderDiff notNil and: [loadOrderMerge notNil]) ifTrue: [^ loadOrderDiff].
	loadOrderMerge := SquotLoadOrderMerge
		into: originalLoadOrder
		merge: patchedLoadOrder
		basedOn: originalLoadOrder.
	^ loadOrderDiff :=
		GenericDiff squotDiffClass new
			file1: originalLoadOrder;
			file2: patchedLoadOrder;
			diff