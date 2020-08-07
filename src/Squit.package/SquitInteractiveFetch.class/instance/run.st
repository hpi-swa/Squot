running
run
	remoteNames ifNil: [^ self error: 'Incompletely initialzed: Remote names missing'].
	promise := Promise new.
	[self withActiveUnitOfWork:
		[[self fetch ifNil: [promise reject] ifNotNil: [promise resolve]]
			ifCurtailed: [promise reject]]] fork.
	^ promise