user interface
waitFor: aWaitable
	"If this is run by the UI process, spawn a new UI process. When the waitable is signalled, terminate the new UI process and reinstante the process that ran this method as the UI process. This leaves the current project in control how the UI loop must be done (rather than duplicating and dictating that here.) Inspired by InstallerSqueakMap>>#update."
	| answer exception oldUiProcess newUiProcess waitingProcess done |
	Project uiProcess isActiveProcess ifFalse: [^ aWaitable wait].
	oldUiProcess := Processor activeProcess.
	done := Semaphore new.
	Project current spawnNewProcess.
	"Start another process that waits in the background, then reinstantes oldProcess as UI process. The oldProcess waits until all of this is over. The reason for a third process is that oldProcess must be suspended temporarily before it can be reinstated in Project class>>resumeProcess:."
	waitingProcess :=
	[[[answer := aWaitable wait]
		on: BrokenPromise do:
			[:bp | bp ifError: [:error | exception := error. bp return] ifNotError: [bp pass]]
		on: Error do:
			[:e | exception := e. e return]]
		ensure:
			[| canContinue |
			newUiProcess := Project current uiProcess.
			(oldUiProcess ~~ newUiProcess and: [oldUiProcess notNil and: [oldUiProcess isTerminated not]]) ifTrue:
				[canContinue := Semaphore new.
				"Let new UI process complete its last cycle."
				Project current addDeferredUIMessage:
					[canContinue signal.
					newUiProcess terminate].
				canContinue wait.
				Project current uiProcess: oldUiProcess].
			done signal]]
		newProcess.
	waitingProcess resume.
	done wait.
	self 
		assert: newUiProcess isTerminated description: 'Second UI Process not terminated';
		assert: Project uiProcess == oldUiProcess description: 'Original UI process not reinstantiated';
		assert: Project uiProcess isActiveProcess description: 'Not running in the UI process'.
	exception ifNotNil:
		[| usesNewExceptionHandling |
		usesNewExceptionHandling := Exception canUnderstand: #resumeEvaluating:.
		usesNewExceptionHandling
			ifTrue:
				["Sending #signal again would act like #outer, which will search handlers from the original handler context of the dead process."
				exception copy
					instVarNamed: 'signalContext' put: nil;
					tag: exception;
					signal]
			ifFalse: [exception signal]].
	^ answer