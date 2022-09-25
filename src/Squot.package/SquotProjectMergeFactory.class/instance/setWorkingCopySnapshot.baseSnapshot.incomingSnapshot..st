initialize-release
setWorkingCopySnapshot: workingCopyProjectSnapshot baseSnapshot: baseVersionProjectSnapshot incomingSnapshot: incomingVersionProjectSnapshot
	workingProjectSnapshot := workingCopyProjectSnapshot.
	baseProjectSnapshot := baseVersionProjectSnapshot.
	incomingProjectSnapshot := incomingVersionProjectSnapshot.
	incomingArtifactsMapping := self consolidateArtifactsOf: workingProjectSnapshot project and: incomingProjectSnapshot project.