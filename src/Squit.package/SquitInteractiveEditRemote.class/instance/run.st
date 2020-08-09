running
run
	promise := Promise new.
	self assert: query notNil description: 'Should have sent remote: first.'.
	self requestRemoteDetails.
	[SquotGUI waitFor: promise] "will be resolved with a SquitAddRemote or rejected with #cancelled"
		on: BrokenPromise do: [:e | e ifNotError: [^ self undo]].