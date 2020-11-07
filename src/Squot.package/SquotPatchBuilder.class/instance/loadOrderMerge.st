SquotPatch
loadOrderMerge
	^ loadOrderMerge
		ifNil: 
			["Use a merge to get additions and removals applied correctly."
			loadOrderMerge := SquotLoadOrderMerge
				into: originalLoadOrder
				merge: patchedLoadOrder copy
				basedOn: originalLoadOrder "=> gets conflicts only through additions applied in different orders"].