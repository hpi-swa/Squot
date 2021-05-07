ui
branchSelection
	self hasProjectSelection ifFalse: [^ nil].
	^ self withUnitOfWork: [(selectedHistorian ifNil: [^ nil]) shortName]