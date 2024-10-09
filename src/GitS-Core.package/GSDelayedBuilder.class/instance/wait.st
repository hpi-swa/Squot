toolbuilder
wait
	| done |
	done := Semaphore new.
	Project current addDeferredUIMessage: [done signal].
	done wait.