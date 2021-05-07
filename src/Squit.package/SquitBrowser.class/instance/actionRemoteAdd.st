actions on working copies
actionRemoteAdd
	"Answer a promise that will be resolved if the remote was added, or rejected with #cancelled."
	| workingCopy |
	workingCopy := self projectSelection ifNil: [^ self].
	^ (SquitInteractiveAddRemote new
		repository: workingCopy repository;
		run)
			then: [:result | self refresh. result].