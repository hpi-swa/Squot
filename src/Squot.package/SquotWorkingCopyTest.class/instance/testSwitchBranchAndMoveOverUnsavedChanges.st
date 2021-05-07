tests branch switching
testSwitchBranchAndMoveOverUnsavedChanges
	| trackedObject class originalHistorian otherHistorian |
	"given
	initial version <otherHistorian ---- change a <originalHistorian ---- (unsaved)"
	repository withUnitOfWork:
	[self assert: repository historianForTemporaryVersions version isNil.
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
	class compileSilently: 'unsavedMethod ^ 0' classified: 'unsaved'.
	"switch and move over to otherHistorian"
	self suppressChangeNotificationsDuring:
		[workingCopy switchAndMoveUnsavedChangesOverTo: otherHistorian].
	self assert: 'unsavedMethod ^ 0' equals: ((class >> #unsavedMethod) getSource asString withLineEndings: ' ') withBlanksCondensed description: 'should have moved over changes'.
	self assert: 'a ^ 1' equals: ((class >> #a) getSource asString withBlanksCondensed withLineEndings: ' ') description: 'should have loaded other objects'].