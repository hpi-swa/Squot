merging
stringMergeLeft: leftString right: rightString base: baseString ifConflict: aBlock
	| diffResult |
	diffResult := Diff3 new
		file0: baseString lines;
		file1: leftString lines;
		file2: rightString lines;
		diffClass: HuntMcilroyDiff;
		merge: true.
	^ (diffResult size = 1 and: [diffResult first key = #ok])
		ifTrue: [diffResult first value joinSeparatedBy: Character cr]
		ifFalse: [aBlock value: (SquotMergeConflict left: leftString right: rightString base: baseString)]