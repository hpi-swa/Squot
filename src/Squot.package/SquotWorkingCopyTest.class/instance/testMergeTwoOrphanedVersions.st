tests
testMergeTwoOrphanedVersions
	"When merging two versions without ancestors, there is no base version. An empty snapshot should be assumed as the base, so nothing will be removed during the merge."
	| operation merge |
	self suppressChangeNotificationsDuring:
	[scenario := SquotWorkingCopyTestMergeTwoOrphanedVersionsScenario forTestCase: self.
	
	"when"
	operation := scenario merge.
	merge := operation merge.
	"then"
	self deny: merge hasConflicts
		description: 'there should be no conflicts'.
	self deny: (merge resolvedPatch diffs anySatisfy: [:each | each isRemoval])
		description: 'nothing should be removed'.
	
	"when"
	operation applyToWorkingCopy].
	"then"
	self assert: workingCopy artifacts size = 2.