SquotPatch
loadOrderMerge
	^ loadOrderMerge
		ifNil: 
			["Use a merge to get additions and removals applied correctly."
			loadOrderMerge := self mergeNewLoadOrder: patchedLoadOrder].