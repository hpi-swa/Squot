running
run
	self inform: ('The rebase hit a {1} operation. Press continue when you are ready.'
					format: {self operationName printString}).
	^ self afterContinue: [self nextOperation]