importing
commitImportedMappers: aCollection on: aCommit
	| commitMessage emptyChangeSets mappersChangeSet |
	emptyChangeSets := Dictionary newFrom:
		(aCollection collect: [:each | each -> (SquotEmptyChangeSet withMapper: each)]).
	mappersChangeSet := self metadataMapper
								changeSetFromMappers: {}
								removing: {}
								changeSets: emptyChangeSets.
	commitMessage := UIManager default
							request: 'Commit message for the repository metadata conversion (leave empty to cancel):'
							initialAnswer: 'Convert repository metadata'.
	commitMessage isEmptyOrNil ifTrue: [^ nil].
	^ self
		commitChangeSets: {mappersChangeSet}
		onCommit: aCommit
		message: commitMessage
		additionalParents: {}
		onlyAdditionalParents: false