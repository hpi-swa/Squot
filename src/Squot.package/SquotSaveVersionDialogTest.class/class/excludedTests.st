accessing
excludedTests
	^ #(
		"Loading and unloading not possible in save dialog."
		testLoadUnloadedArtifact testDoNotLoadAddedArtifact testToggleLoadAddedArtifact testLoadUnloadedArtifact testLeaveUnloadedArtifactUnloaded testLoadUnloadedArtifactDuringModification
	)