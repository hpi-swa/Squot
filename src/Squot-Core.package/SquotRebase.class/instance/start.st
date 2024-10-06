running
start
	self hasStarted ifTrue: [^ Promise unit: nil].
	^ (self browser ensureHeadCommitMaterializedTo: 'rebase')
		then: [:x | self originalHeadCommit: self workingCopy headCommit]