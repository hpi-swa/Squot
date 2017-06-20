*Squot-shadow-diffing
squotDiffAgainst: otherSnapshot withBase: baseSnapshot
	| merger |
	[merger := MCThreeWayMerger 
				base: self
				target: otherSnapshot
				ancestor: baseSnapshot]
		on: MCNoChangesException do: [:e | e resume "swallow 'no changes' inform"].
	^ SquotMonticelloMergeDiff operations: merger operations conflicts: merger conflicts