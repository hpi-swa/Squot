tests cherry picking
testCherryPickDoesNotSaveUnrelatedChanges
	| cherryPick merge |
	"cherry pick the version of the other historian"
	self suppressChangeNotificationsDuring:
	[scenario := SquotSimpleMergeTestScenario forTestCase: self.
	"introduce an unrelated, unsaved change"
	scenario sampleClass compileSilently: 'firstMethod ^ #changed'.
	cherryPick := workingCopy newCherryPickOperation
		pickedVersion: scenario thirdVersion;
		relevantParentOfPickedVersion: scenario firstVersion;
		message: 'new version'.
	merge := cherryPick prepareMerge.
	self assert: ((merge mergeAt: scenario packageId)
			mergeOfTrackedObject
			modifications
			noneSatisfy:
				[:each | each definition isMethodDefinition
					and: [each definition selector = 'firstMethod']])
		description: 'unsaved change should be unaffected'.
	cherryPick applyMerge.
	self assert: scenario sampleClass new firstMethod = #changed
		description: 'unsaved change should be unaffected by merge'.
	cherryPick save].
	self assert: scenario sampleClass new firstMethod = #changed
		description: 'unsaved change should be unaffected by save'.
	self suppressChangeNotificationsDuring:
		[workingCopy discardUnsavedChanges].
	self deny: scenario sampleClass new firstMethod = #changed
		description: 'Changes should have been discarded'.