*Squot-Tools
hasContentsInExplorer
	^ super hasContentsInExplorer or: [itemSlots notNil and: [itemSlots notEmpty]]