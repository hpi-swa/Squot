results
selectedChanges
	"Answer artifacts that differ from the originalSnapshot"
	^ Array streamContents: [:stream |
		diffRootNodes do: [:eachRoot | | artifact |
			artifact := originalSnapshot artifactAt: eachRoot title ifAbsent: [].
			artifact
				ifNil: [artifact := proposedSnapshot artifactAt: eachRoot title.
					self putProposed: artifact
						withoutExcludedChangesFrom: eachRoot
						into: stream]
				ifNotNil: [self put: artifact
						withIncludedChangesFrom: eachRoot
						into: stream]]]