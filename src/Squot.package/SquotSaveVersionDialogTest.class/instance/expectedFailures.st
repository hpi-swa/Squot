failures
expectedFailures
	^ super expectedFailures,
		#(testDoNotLoadAddedArtifact testToggleLoadAddedArtifact) "Because you cannot make something unloaded during a save."