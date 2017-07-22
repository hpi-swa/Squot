*Squot-shadow-diffing
squotDiffAgainst: otherSnapshot with: aDiffBuilder
	^ aDiffBuilder diffFrom: self to: otherSnapshot
		ifNew: [MCPatch fromBase: self target: otherSnapshot]
		andInitialize: []