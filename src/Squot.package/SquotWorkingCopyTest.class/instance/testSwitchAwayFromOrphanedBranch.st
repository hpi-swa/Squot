tests branch switching
testSwitchAwayFromOrphanedBranch
	| class trackedObject existingHistorian orphanedHistorian |
	"given"
	repository withUnitOfWork:
		[self suppressChangeNotificationsDuring: [class := classFactory newClass].
			class compileSilently: 'a ^ #originalReturnValue' classified: 'will not be changed'.
			trackedObject := self addPackage.
		workingCopy saveVersionWithMessage: 'initial version'.
		existingHistorian := workingCopy loadedHistorian.
		orphanedHistorian := repository historianNamed: 'newHistorian'.
		workingCopy 
			loadedHistorian: orphanedHistorian;
			loadedVersion: nil.
		"when"
		self suppressChangeNotificationsDuring: [workingCopy switchTo: existingHistorian].
		"then"
		self assert: class new a == #originalReturnValue.
		
		
		workingCopy 
			loadedHistorian: orphanedHistorian;
			loadedVersion: nil.
		"when"
		self suppressChangeNotificationsDuring:
			[workingCopy switchAndMoveUnsavedChangesOverTo: existingHistorian].
		"then"
		self assert: class new a == #originalReturnValue].