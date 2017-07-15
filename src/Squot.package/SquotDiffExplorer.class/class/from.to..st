instance creation
from: baseSnapshot to: loadedSnapshot
	^ self new
		addOriginalArtifacts: (baseSnapshot artifacts select: [:each | each isLoadable]);
		addProposedArtifacts: (loadedSnapshot artifacts select: [:each | each isLoadable]);
		yourself