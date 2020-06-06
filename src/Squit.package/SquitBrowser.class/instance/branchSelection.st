ui
branchSelection
	^ self withUnitOfWork: [(selectedHistorian ifNil: [^ nil]) shortName]