instance creation
from: baseSnapshot to: loadedSnapshot
	^ self new
		addOriginalArtifacts: baseSnapshot artifacts;
		addProposedArtifacts: loadedSnapshot artifacts;
		yourself