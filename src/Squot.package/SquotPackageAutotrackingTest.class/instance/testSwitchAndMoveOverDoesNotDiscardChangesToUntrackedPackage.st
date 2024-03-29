tests
testSwitchAndMoveOverDoesNotDiscardChangesToUntrackedPackage
	"When switching (back) to a version that already contains a loaded package, do not silently discard any changes made to that package while it was not tracked."
	| mainBranch otherBranch |
	"given"
	workingCopy saveVersionWithMessage: 'empty base version'.
	mainBranch := workingCopy loadedHistorian.
	(otherBranch := repository historianNamed: 'other') version: workingCopy baseVersion.
	self savePackageAndKeep.
	self deny: (workingCopy patchRelativeToBase: workingCopy baseVersion) hasChanges.
	workingCopy switchTo: otherBranch.
	self deny: (workingCopy includesObjectAt: path).
	class compileSilently: 'b ^ 2'. "Not a conflict with the saved version of the package"
	"when"
	[workingCopy switchAndMoveUnsavedChangesOverTo: mainBranch]
	"then"
		on: SquotMergeRequested do:
			[:request | self fail: 'Should not have prompted a merge'].
	self assert: 2 equals: class new b description: 'Unsaved change still loaded';
		assert: (workingCopy objectAt: path) = package description: 'should track package again'.