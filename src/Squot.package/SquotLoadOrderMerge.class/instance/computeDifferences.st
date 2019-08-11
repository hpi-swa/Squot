private
computeDifferences
	diff3merge := Diff3 new
		diffClass: GenericDiff squotDiffClass;
		file0: base;
		file1: working;
		file2: incoming;
		mergeClean.
	self collectConflicts.
	self collectModifications.
	self autoResolveConflicts.