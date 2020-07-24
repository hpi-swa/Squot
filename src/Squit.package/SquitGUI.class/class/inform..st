user interface
inform: aString
	"Make sure the dialog is run in the UI process."
	| uiCompleted |
	Project uiProcess isActiveProcess ifTrue: [^ super inform: aString].
	uiCompleted := Semaphore new.
	Project current addDeferredUIMessage:
		[super inform: aString.
		uiCompleted signal].
	uiCompleted wait.