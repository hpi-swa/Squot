private
computeLoadOrderDiff
	loadOrderDiff ifNotNil: [^ loadOrderDiff].
	^ loadOrderDiff :=
		GenericDiff squotDiffClass new
			file1: originalLoadOrder;
			file2: patchedLoadOrder;
			diff