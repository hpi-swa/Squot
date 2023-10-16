auto-merging
mergeSourcesLeft: leftSource right: rightSource base: baseSource
	| diffResult |
	diffResult := Diff3 new
		file0: baseSource lines;
		file1: leftSource lines;
		file2: rightSource lines;
		diffClass: HuntMcilroyDiff;
		merge: true.
	^ (diffResult size = 1 and: [diffResult first key = #ok])
		ifTrue: [diffResult first value joinSeparatedBy: Character cr]
		ifFalse: [nil]