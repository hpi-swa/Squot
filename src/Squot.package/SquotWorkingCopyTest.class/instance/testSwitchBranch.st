tests
testSwitchBranch
	| trackedObject class originalHistorian otherHistorian |
	"given"
	self suppressChangeNotificationsDuring: [class := classFactory newClass].
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
	"switch to otherHistorian"
	self suppressChangeNotificationsDuring: [workingCopy switchTo: otherHistorian].
	self assert: 'a ^ 1' equals: ((class >> #a) getSource asString withLineEndings: ' ') withBlanksCondensed description: 'loaded other version'.
	"switch back and assert that we got the uncommitted changes back"
	self suppressChangeNotificationsDuring: [workingCopy switchTo: originalHistorian].
	self assert: 'a ^ 3' equals: ((class >> #a) getSource asString withLineEndings: ' ') withBlanksCondensed description: 'restored unsaved changes'.
	