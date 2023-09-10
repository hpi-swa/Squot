resolving
mergeStrings
	| chunks |
	chunks := Diff3 new
		file0: self baseString lines;
		file1: self leftString lines;
		file2: self rightString lines;
		diffClass: HuntMcilroyDiff;
		merge: true.
	^ SquotTextUtilities joinTexts: (Array streamContents: [:stream |
		chunks do: [:chunk |
			chunk key caseOf: {
				[#ok] -> [stream nextPutAll: chunk value].
				[#conflict] -> [	self conflictLines: chunk value on: stream]}]])