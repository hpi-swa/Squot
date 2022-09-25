as yet unclassified
merge: incomingProjectSnapshot into: workingProjectSnapshot basedOn: baseProjectSnapshot
	^ self setWorkingCopySnapshot: workingProjectSnapshot
		baseSnapshot: baseProjectSnapshot
		incomingSnapshot: incomingProjectSnapshot;
		compareWholeProjects;
		projectMerge