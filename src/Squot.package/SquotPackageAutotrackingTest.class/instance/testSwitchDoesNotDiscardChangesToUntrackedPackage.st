tests
testSwitchDoesNotDiscardChangesToUntrackedPackage
	"When switching (back) to a version that already contains a loaded package, do not silently discard any changes made to that package while it was not tracked."
	| mainBranch otherBranch mergePrompted |
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
	mergePrompted := false.
	[workingCopy switchTo: mainBranch]
		on: SquotMergeRequested do:
			[:request | | packageMerge |
			mergePrompted := true.
			"Exclude all changes"
			packageMerge := SquotToggles useNewApi
				ifTrue: [(request merge mergeAt: (workingCopy project artifacts detect: [:each | each path = path]) id) elementMerges anyOne]
				ifFalse: [(request merge mergeAt: path) elementMerges anyOne].
			self assert: {#b} equals: (packageMerge modifications collect: [:each | each definition selector]). 
			packageMerge modifications do: [:each | packageMerge removeOperationOrConflict: each].
			request resume].
	"then"
	self assert: 2 equals: class new b description: 'Unsaved change should still be loaded';
		assert: (workingCopy objectAt: path) = package description: 'should track package again';
		assert: mergePrompted. "Since the merge was unexpected, the user should be aware of it."