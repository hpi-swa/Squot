tests
testUnnecessaryMergeIsCanceled
	| firstVersion |
	"given"
	workingCopy
		saveVersionWithMessage: 'first version';
		saveVersionWithMessage: 'successor version'.
	firstVersion := workingCopy baseVersion parents first.
	self should:
		"when"
		[workingCopy newMergeOperation
			mergeVersion: firstVersion;
			prepare;
			applyToWorkingCopy]
		"then"
		raise: SquotVersionAlreadyInHistory.