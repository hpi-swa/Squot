results
selectedChanges
	canceled == false ifFalse: [^ nil].
	"Answer artifacts that differ from the originalSnapshot"
	^ Array streamContents: [:stream |
		rootNodes do: [:eachRoot |
			original at: eachRoot title
				ifPresent: [:artifact |
					self put: artifact
						withIncludedChangesFrom: eachRoot
						into: stream]
				ifAbsent: [
					self putProposed: (proposed at: eachRoot title)
						withoutExcludedChangesFrom: eachRoot
						into: stream]]]