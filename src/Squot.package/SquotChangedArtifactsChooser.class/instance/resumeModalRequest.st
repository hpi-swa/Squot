public
resumeModalRequest
	view ifNil: [self error: 'Tool was not opened yet'].
	promise ifNil: [self error: 'Tool was not opened with selectedChangesWithTitle:'].
	[ToolBuilder default runModal: view]
		ifCurtailed:
			["Make sure we will notice in a new UI process when the view is closed."
			self future resumeModalRequest].
	"If we finally get here, the view was closed."
	self accepted ifTrue: [promise resolve] ifFalse: [promise reject].