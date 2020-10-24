tests merging
testLoadOrderAfterReaddingObjectDuringMerge
	"Relates to testRemovalAndChange, but only focuses on the load order.
	The readded artifact should be readded in the same place as in the incoming changes."
	| text others baseVersion leftVersion rightVersion operation merge conflict |
	"given"
	text := Text fromString: 'Base text'.
	others := OrderedCollection new.
	repository withUnitOfWork:
	[workingCopy
		add: (others add: (ValueHolder new contents: 1)) at: 'first other';
		add: text at: 'text';
		add: (others add: (ValueHolder new contents: 2)) at: 'second other'.
	self assert: #('first other' 'text' 'second other') equals: workingCopy loadOrder asArray.
	workingCopy saveVersionWithMessage: 'base version'.
	baseVersion := workingCopy loadedHistorian version.
	text replaceFrom: 1 to: text size with: 'Changed text'.
	workingCopy saveVersionWithMessage: 'right-side version'.
	rightVersion := workingCopy loadedHistorian version.
	workingCopy loadedHistorian version: baseVersion.
	workingCopy
		discardUnsavedChanges; "reset text to baseVersion"
		remove: text;
		saveVersionWithMessage: 'left-side version'.
	leftVersion := workingCopy loadedHistorian version.
	
	"when"
	merge := (operation := workingCopy newMergeOperation)
		mergeVersion: rightVersion;
		prepare.
	"then"
	conflict := merge conflictAt: 'text'.
	self assert: conflict isResolved not.
	
	"when"
	conflict chooseIncoming. "the changed text"
	operation applyToWorkingCopy.
	"then"
	self assert: (workingCopy includesObjectAt: 'text');
		assert: #('first other' 'text' 'second other')
		equals: (workingCopy loadOrder asArray intersection: #('first other' 'text' 'second other'))].