*Squot-Tools
initializeSquotDiffNodes: diffNodes with: aDiffNodesBuilder
	working startName = incoming startName
		ifTrue: [self mergeOfStartObject initializeSquotDiffNodes: diffNodes with: aDiffNodesBuilder]
		ifFalse: ["Nothing for now. Maybe add children nodes?" self flag: #stub].