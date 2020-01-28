tests
testSwitchBranchAndMoveOverUnsavedChangesWithConflict
	| trackedObject class originalHistorian otherHistorian hadConflict |
	"given
	initial version <otherHistorian ---- change a <originalHistorian ---- (stashed)
	  `--- (unsaved)"
	self suppressChangeNotificationsDuring: [class := classFactory newClass].
	class compileSilently: 'savedMethod ^ 1' classified: 'safe'.
	class compileSilently: 'a ^ 1' classified: 'to be changed'.
	trackedObject := self addPackage.
	workingCopy saveVersionWithMessage: 'initial version'.
	originalHistorian := workingCopy loadedHistorian.
	otherHistorian := repository historianNamed: 'other'.
	otherHistorian version: originalHistorian version.
	"change and save"
	class compileSilently: 'a ^ 2' classified: 'to be changed'.
	workingCopy saveVersionWithMessage: 'change a'.
	"change but do not save"
	class compileSilently: 'a ^ 3' classified: 'unsaved'.
	"switch to otherHistorian and generate a different change"
	self suppressChangeNotificationsDuring: [workingCopy switchTo: otherHistorian].
	class compileSilently: 'a ^ 4' classified: 'unsaved'.
	"switch back, trying to move over changes"
	hadConflict := false.
	self suppressChangeNotificationsDuring:
	[[workingCopy switchAndMoveUnsavedChangesOverTo: originalHistorian]
	on: SquotMergeRequested doAndResume: [:request | | merge |
		hadConflict := true.
		self assert: request merge hasConflicts.
		merge := request merge elementMerges detect: #hasConflicts.
		self assert: 'a ^ 3' equals: ((merge working shadowOfTrackedObject asMCSnapshot definitions detect: [:each | each isMethodDefinition and: [each selector == #a]]) source withBlanksCondensed withLineEndings: ' ').
		self assert: 'a ^ 4' equals: ((merge incoming shadowOfTrackedObject asMCSnapshot definitions detect: [:each | each isMethodDefinition and: [each selector == #a]]) source withBlanksCondensed withLineEndings: ' ').
		merge := merge chooseIncoming]].
	self assert: hadConflict.
	self assert: 'a ^ 4' equals: ((class >> #a) getSource asString withLineEndings: ' ') withBlanksCondensed description: 'moved over changes'.