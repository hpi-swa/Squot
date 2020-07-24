private
runInUiProcess: aBlock
	"Make sure the dialog is run in the UI process."
	| uiCompleted answer |
	Project uiProcess isActiveProcess ifTrue: [^ aBlock value].
	uiCompleted := Semaphore new.
	Project current addDeferredUIMessage:
		[answer := aBlock value.
		uiCompleted signal].
	uiCompleted wait.
	^ answer