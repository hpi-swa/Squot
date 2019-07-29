tests
testMergeTwoOrphanedVersions
	"When merging two versions without ancestors, there is no base version. An empty snapshot should be assumed as the base, so nothing will be removed during the merge."
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestMergeTwoOrphanedVersionsScenario forTestCase: self.
	"when"
	[[scenario merge]
	on: SquotMergeRequested do: [:request | | |
		self deny: request merge hasConflicts
			description: 'there should be no conflicts'.
		self assert: (request merge diffs allSatisfy: [:each | each isRemoval not])
			description: 'nothing should be removed'.
		request resume]
	] valueSupplyingAnswers: {{'*'. #default}}].
	"then"
	self assert: workingCopy artifacts size = 2.