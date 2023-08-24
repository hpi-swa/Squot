as yet unclassified
merge: leftTree with: rightTree base: baseTree into: resultTree at: aPath
	| entries |
	entries := Set new
		addAll: leftTree entries keys;
		addAll: rightTree entries keys;
		yourself.
	entries do: [:entry | | leftEntry rightEntry baseEntry |
		leftEntry := leftTree entryAt: entry ifAbsent: [nil].
		rightEntry := rightTree entryAt: entry ifAbsent: [nil].
		baseEntry := baseTree entryAt: entry ifAbsent: [nil].
		self caseOf:{
			[leftEntry = rightEntry] -> [resultTree putEntry: leftEntry].
			[leftEntry = baseEntry] -> [resultTree putEntry: rightEntry].
			[rightEntry = baseEntry] -> [resultTree putEntry: leftEntry].
		} otherwise: [self
						handleConflictAt: aPath / entry
						left: leftEntry
						right: rightEntry
						base: baseEntry
						into: resultTree]].