tests merging
testMergeSingleArtifact
	"When a merge is performed for a single artifact, only this loaded artifact should change in the process."
	| class relevantObject unrelatedObject unrelatedId mergedId baseVersion leftVersion rightVersion rightArtifact mergeOperation |
	"given"
	repository withUnitOfWork:
	["base version"
	self workingCopy add: (unrelatedObject := ValueHolder new contents: 'unrelated') at: 'unrelated'.
	unrelatedId := self workingCopy idOfObject: unrelatedObject.
	(self suppressChangeNotificationsDuring: [class := classFactory newClass])
		compileSilently: 'mergeMe ^ 1' classified: 'to-be-changed'.
	self workingCopy
		add: (relevantObject := PackageInfo new packageName: classFactory packageName)
		at: 'to-be-merged'.
	mergedId := self workingCopy idOfObject: relevantObject.
	self workingCopy saveVersionWithMessage: 'base version'.
	baseVersion := self workingCopy loadedHistorian version.
	"right-side version"
	unrelatedObject contents: 'unrelated1'.
	self suppressChangeNotificationsDuring:
		[class organization classify: #mergeMe under: 'something else' logged: false].
	self workingCopy saveVersionWithMessage: 'right-side version'.
	rightVersion := self workingCopy loadedHistorian version.
	rightArtifact := rightVersion artifacts at: mergedId.
	"left-side version"
	self workingCopy loadedHistorian version: baseVersion.
	self suppressChangeNotificationsDuring: [self workingCopy discardUnsavedChanges].
	class compileSilently: 'addedMethod ^ self' classified: 'should be kept'.
	unrelatedObject contents: 'unrelated2'.
	self workingCopy saveVersionWithMessage: 'left-side version'.
	leftVersion := self workingCopy loadedHistorian version.
	"when"
	self suppressChangeNotificationsDuring:
		[mergeOperation := self workingCopy newMergeOperation.
		mergeOperation
			workingVersion: workingCopy loadedVersion;
			mergeVersion: rightVersion;
			mergeScope: (SquotMergeOperationArtifactScope operation: mergeOperation artifact: rightArtifact);
			doNotAddParent;
			prepare.
		"then"
		self assert: (mergeOperation merge modifies: rightArtifact).
		self deny: (mergeOperation merge includesModificationAt: unrelatedId).
		mergeOperation applyToWorkingCopy].
	self assert: 'something else' = (class organization categoryOfElement: #mergeMe).
	self assert: (class methodDictionary includesKey: #addedMethod).
	self assert: 'unrelated2' equals: (self workingCopy objectAt: unrelatedId) contents].