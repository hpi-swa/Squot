tests
testOldCherryPickOfOrphanedVersion
	"When cherry-picking a version without ancestor, there is no base version. An empty snapshot should be assumed as the base, so nothing will be removed during the merge."
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestMergeTwoOrphanedVersionsScenario forTestCase: self.
	"when"
	[[[scenario cherryPick] on: Deprecation do: [:e | e resume]]
	on: SquotMergeRequested do: [:request |
		self deny: request merge hasConflicts
			description: 'there should be no conflicts'.
		self deny: (request merge resolvedPatch diffs anySatisfy: [:each | each isRemoval])
			description: 'nothing should be removed'.
		request resume]
	on: SquotSelectionOfChangesForSaveRequested
	do: [:request | request message: 'new version'; resume]
	] valueSupplyingAnswers: {{'*'. #default}}].
	"then"
	self assert: workingCopy artifacts size = 2.