merging
mergeSourceBase: baseSource left: leftSource right: rightSource
	| chunks |
	chunks := Diff3 new
		file0: baseSource lines;
		file1: leftSource lines;
		file2: rightSource lines;
		diffClass: GSTextUtilities diffClass;
		merge: true.
	^ GSTextUtilities joinTexts: (Array streamContents: [:stream |
		chunks do: [:chunk |
			chunk key caseOf: {
				[#ok] -> [stream nextPutAll: chunk value].
				[#conflict] -> [	self conflictLines: chunk value on: stream]}]])