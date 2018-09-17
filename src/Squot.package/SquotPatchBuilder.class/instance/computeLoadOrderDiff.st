private
computeLoadOrderDiff
	^ GenericDiff squotDiffClass new
		file1: originalLoadOrder;
		file2: patchedLoadOrder;
		diff