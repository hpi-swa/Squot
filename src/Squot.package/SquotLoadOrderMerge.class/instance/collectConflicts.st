private
collectConflicts
	(diff3merge anySatisfy: [:each | each key = #conflict and: [working includesAnyOf: each value right]])
		ifTrue: [self flag: #notYetImplemented.
				"Warning signal: 'Merging of load orders with conflicts is not yet implemented properly.'"].
	containerConflicts addAll:
		((diff3merge select: [:each | each key = #conflict])
			collect: [:each | SquotLoadOrderConflict with: each value]).