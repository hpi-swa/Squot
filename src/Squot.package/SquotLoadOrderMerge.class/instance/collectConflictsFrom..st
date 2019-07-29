private
collectConflictsFrom: aDiff3MergeArray
	(aDiff3MergeArray anySatisfy: [:each | each key = #conflict and: [workingLoadOrder includesAnyOf: each value right]])
		ifTrue: [self flag: #notYetImplemented.
				Warning signal: 'Merging of load orders with conflicts is not yet implemented properly.'].
	conflicts addAll:
		((aDiff3MergeArray select: [:each | each key = #conflict])
			collect: [:each | SquotLoadOrderConflict with: each value]).