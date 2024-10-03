merging
stringMergeLeft: leftString right: rightString base: baseString ifUnchanged: unchangedBlock ifMerged: mergedBlock ifConflict: conflictBlock
	| leftLines diffResult |
	leftLines := leftString lines.
	diffResult := Diff3 new
		file0: baseString lines;
		file1: leftLines;
		file2: rightString lines;
		diffClass: HuntMcilroyDiff;
		merge: true.
	^ (diffResult size = 1 and: [diffResult first key = #ok])
		ifFalse: [conflictBlock value: (SquotMergeConflict left: leftString right: rightString base: baseString)]
		ifTrue: [ | mergedLines |
			mergedLines := diffResult first value.
			mergedLines = leftLines
				ifTrue: [unchangedBlock value]
				ifFalse: [mergedBlock value: (mergedLines joinSeparatedBy: Character cr)]]