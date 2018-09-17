public
diffPath: path from: leftArtifactsDictionary to: rightArtifactsDictionary
	self addDiff:
		(leftArtifactsDictionary at: path
			ifPresent: [:leftArtifact | | rightArtifact |
				rightArtifact := rightArtifactsDictionary at: path ifAbsent: [].
				rightArtifact
					ifNotNil: [leftArtifact diffAgainst: rightArtifact]
					ifNil: [SquotArtifactRemoval of: leftArtifact]]
			ifAbsent: [SquotArtifactAddition of: (rightArtifactsDictionary at: path)])