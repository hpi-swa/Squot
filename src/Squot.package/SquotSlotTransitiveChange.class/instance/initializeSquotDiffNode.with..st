*Squot-Tools-Diffs
initializeSquotDiffNode: aDiffNode with: aDiffNodesBuilder
	self flag: #stub.
	aDiffNode
		title: self hierarchicalDiffTitle;
		content: self;
		children: #().