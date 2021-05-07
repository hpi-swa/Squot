actions
actionPull
	"Pulls into the active (not the selected!) branch"
	| workingCopy |
	self hasProjectSelection ifFalse: [^ self].
	workingCopy := self projectSelection.
	[self withUnitOfWork:
		[self pullUpstream: workingCopy]]
		fork.