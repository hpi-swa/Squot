tests
diffAt: path in: aMerge
	^ aMerge containerModifications at: path ifAbsent:
		[(aMerge elementMerges at: path) resolvedPatch]