failures
expectedFailures
	^ super expectedFailures, {
		"Merge targets are still assumed to be always loaded"
		#testUnloadedArtifactsAdorned. #testLoadUnloadedArtifact. #testLoadUnloadedArtifactDuringModification. #testLeaveUnloadedArtifactUnloaded.
	}