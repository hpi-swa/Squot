private accessing
updateArtifactIdFrom: oldArtifactId to: newArtifactId
	| artifact store |
	artifact := project removeArtifactAt: oldArtifactId.
	store := stores removeKey: oldArtifactId ifAbsent: [].
	artifact id: newArtifactId.
	project putArtifact: artifact.
	store ifNotNil: [stores at: artifact id put: store].