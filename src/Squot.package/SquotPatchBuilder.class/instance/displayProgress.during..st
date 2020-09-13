private
displayProgress: progressText during: aBlock
	SquotGUI displayProgress: progressText during:
		[:newprogress | progress := newprogress.
		progress totalSteps: (1 max: leftArtifacts size + (rightArtifacts keys copyWithoutAll: leftArtifacts keys) size).
		^ [aBlock value]
			ensure: [progress := nil]]