running
run
	remoteNames ifNil: [^ self error: 'Incompletely initialzed: Remote names missing'].
	[self withRemoteErrorHandlingDo:
		[self withCredentialsHandlingDo: 
			[self fetch]]]
		ifCurtailed: [^ promise reject].
	self flag: #todo. "In the future, might collect all updated refs and resolve the promise with that."
	^ promise resolve