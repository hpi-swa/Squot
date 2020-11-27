*Squot-Tools
unloadedArtifactsFromLeft
	^ leftArtifacts select: [:each | (each respondsTo: #isLoaded) and: [each isLoaded not]]