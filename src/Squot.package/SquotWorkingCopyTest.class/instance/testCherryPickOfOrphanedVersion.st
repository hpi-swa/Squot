tests cherry picking
testCherryPickOfOrphanedVersion
	"When cherry-picking a version without ancestor, there is no base version. An empty snapshot should be assumed as the base, so nothing will be removed during the merge."
	| cherryPick merge |
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestMergeTwoOrphanedVersionsScenario forTestCase: self.
	cherryPick := workingCopy newCherryPickOperation
		pickedVersion: scenario firstVersion;
		relevantParentOfPickedVersion: nil; "there is no parent version"
		message: 'new version'.
	merge := cherryPick prepareMerge.
	self deny: merge hasConflicts
		description: 'there should be no conflicts'.
	self deny: (merge resolvedPatch diffs anySatisfy: [:each | each isRemoval])
		description: 'nothing should be removed'.
	cherryPick applyMerge.
	cherryPick save].
	"then"
	self assert:
		(workingCopy artifacts keys includesAllOf:
			(scenario firstVersion artifacts keys, scenario secondVersion artifacts keys));
		assert: scenario firstVersionArtifact id equals: (workingCopy artifactAt: scenario firstVersionArtifact path) id;
		assert: scenario secondVersionArtifact id equals: (workingCopy artifactAt: scenario secondVersionArtifact path) id.