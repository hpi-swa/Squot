private
displayProgress: progressText during: aBlock
	SquotProgress display: progressText during:
		[:newprogress | progress := newprogress.
		progress totalSteps: (1 max: leftArtifacts size + (rightArtifacts keys copyWithoutAll: leftArtifacts keys) size).
		^ [aBlock value]
			ensure: [progress := nil]]