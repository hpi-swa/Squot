running
run
	remoteNames ifNil: [^ self error: 'Incompletely initialzed: Remote names missing'].
	promise := Promise new.
	Project current addDeferredUIMessage:
		[self withRemoteErrorHandlingDo:
			[self withCredentialsHandlingDo: 
				[self fetch]]].
	^ promise