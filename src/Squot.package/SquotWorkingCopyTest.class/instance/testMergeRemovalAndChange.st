tests merging
testMergeRemovalAndChange
	| text baseVersion leftVersion rightVersion operation merge conflict |
	"given"
	repository withUnitOfWork:
	[self workingCopy add: (text := ValueHolder new contents: 'Base text') at: 'text'.
	self workingCopy saveVersionWithMessage: 'base version'.
	baseVersion := self workingCopy loadedHistorian version.
	text contents: 'Changed text'.
	self workingCopy saveVersionWithMessage: 'right-side version'.
	rightVersion := self workingCopy loadedHistorian version.
	self workingCopy loadedHistorian version: baseVersion.
	self workingCopy
		discardUnsavedChanges;
		remove: text.
	self workingCopy saveVersionWithMessage: 'left-side version'.
	leftVersion := self workingCopy loadedHistorian version.
	
	"when"
	merge := (operation := self workingCopy newMergeOperation)
		mergeVersion: rightVersion;
		prepare.
	"then"
	conflict := merge conflictAt: 'text'.
	self assert: conflict isResolved not.
	
	"when"
	conflict chooseIncoming. "the changed text"
	operation applyToWorkingCopy.
	"then"
	self assert: 'Changed text' equals: (self workingCopy objectAt: 'text') contents].