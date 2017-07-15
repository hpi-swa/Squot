tests
testSwitchBranchAndMoveOverUnsavedChanges
	| trackedObject class originalHistorian otherHistorian |
	"given"
	class := classFactory newClass.
	class compileSilently: 'savedMethod ^ 1' classified: 'safe'.
	class compileSilently: 'a ^ 1' classified: 'to be changed'.
	trackedObject := PackageInfo named: classFactory packageName.
	workingCopy add: trackedObject at: 'tracked'.
	workingCopy saveNewVersionMessage: 'initial version' interactive: false.
	originalHistorian := workingCopy loadedHistorian.
	otherHistorian := repository historianNamed: 'other'.
	otherHistorian version: originalHistorian version.
	"change and save"
	class compileSilently: 'a ^ 2' classified: 'to be changed'.
	workingCopy saveNewVersionMessage: 'change a' interactive: false.
	"change but do not save"
	class compileSilently: 'a ^ 3' classified: 'unsaved'.
	"switch and move over to otherHistorian"
	workingCopy switchAndMoveUnsavedChangesOverTo: otherHistorian.
	self assert: 'a ^ 3' equals: ((class >> #a) getSource asString withLineEndings: ' ') withBlanksCondensed description: 'moved over changes'.