tests
testMergeFastForward
	| advancedHistorian |
	"given"
	workingCopy add: (Text fromString: 'sample') at: 'text.txt'.
	repository withUnitOfWork:
		[workingCopy saveVersionWithMessage: 'Add text'.
		(workingCopy objectAt: 'text.txt') allBold.
		workingCopy saveVersionWithMessage: 'Make text bold'.
		(repository historianNamed: 'behind') version: workingCopy baseVersion parents first.
		advancedHistorian := workingCopy loadedHistorian.
		workingCopy switchTo: (repository historianNamed: 'behind')].
	"Merge the version of the advanced historian."
	repository withUnitOfWork:
		[workingCopy newMergeOperation
			mergeVersion: advancedHistorian version;
			prepare;
			applyToWorkingCopy].
	"Branch could be fast-forwarded."
	repository withUnitOfWork:
		[self assert: advancedHistorian version equals: workingCopy loadedVersion;
		assert: workingCopy additionalParents isEmpty].