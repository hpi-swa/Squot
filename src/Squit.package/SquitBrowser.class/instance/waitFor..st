user requests
waitFor: aWaitable
	"If this is run by the UI process, spawn a new UI process. When the waitable is signalled, terminate the new UI process and reinstante the process that ran this method as the UI process. This leaves the current project in control how the UI loop must be done (rather than duplicating and dictating that here.) Inspired by InstallerSqueakMap>>#update."
	| answer |
	Project uiProcess isActiveProcess
		ifTrue:
			[ | oldProcess newProcess done |
			oldProcess := Processor activeProcess.
			done := Semaphore new.
			Project current spawnNewProcess.
			"Start another process that waits in the background, then reinstantes oldProcess as UI process. The oldProcess waits until all of this is over. The reason for that is that oldProcess must be suspended temporarily before it can be reinstated in Project class>>resumeProcess:."
			[[answer := aWaitable wait]
				ensure:
					[| canContinue |
					newProcess := Project uiProcess.
					(oldProcess ~~ newProcess and: [oldProcess notNil and: [oldProcess isTerminated not]]) ifTrue:
						[canContinue := Semaphore new.
						Project current addDeferredUIMessage:
							[canContinue signal.
							newProcess terminate].
						canContinue wait.
						oldProcess suspend.
						Project resumeProcess: oldProcess].
					done signal]]
				fork.
			done wait.
			self 
				assert: newProcess isTerminated;
				assert: Project uiProcess == oldProcess;
				assert: Project uiProcess isActiveProcess]
		ifFalse: [answer := aWaitable wait].
	^ answer