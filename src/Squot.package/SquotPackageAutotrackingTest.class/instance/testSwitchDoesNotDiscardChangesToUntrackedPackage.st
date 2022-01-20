tests
testSwitchDoesNotDiscardChangesToUntrackedPackage
	"When switching (back) to a version that already contains a loaded package, do not silently discard any changes made to that package while it was not tracked."
	| mainBranch otherBranch mergePrompted |
	"given"
	workingCopy saveVersionWithMessage: 'empty base version'.
	mainBranch := workingCopy loadedHistorian.
	(otherBranch := repository historianNamed: 'other') version: workingCopy baseVersion.
	self savePackage; trackPackage.
	self deny: (workingCopy patchRelativeToBase: workingCopy baseVersion) hasChanges.
	workingCopy switchTo: otherBranch.
	self deny: (workingCopy includesObjectAt: path).
	class compileSilently: 'b ^ 2'. "Not a conflict with the saved version of the package"
	"when"
	mergePrompted := false.
	[workingCopy switchTo: mainBranch]
		on: SquotMergeRequested do:
			[:request | mergePrompted := true.
			self assert: (request merge includesModificationAt: path).
			request resume].
	self assert: 2 equals: class new b description: 'Unsaved change should still be loaded';
		assert: (workingCopy objectAt: path) = package description: 'should track package again';
		assert: mergePrompted. "Since the merge was unexpected, the user should be aware of it."