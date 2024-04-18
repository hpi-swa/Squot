importing
commitImportedMappers
	| commitMessage emptyChangeSets mappersChangeSet |
	emptyChangeSets := Dictionary newFrom:
		(self mappers collect: [:each | each -> (SquotEmptyChangeSet withMapper: each)]).
	mappersChangeSet := self mappersMapper
								changeSetFromMappers: {}
								removing: {}
								changeSets: emptyChangeSets.
	commitMessage := UIManager default
							request: 'Commit message for the repository metadata conversion (leave empty to cancel):'
							initialAnswer: 'Convert repository metadata'.
	commitMessage ifEmpty: [^ self].
	self
		commitChangeSets: {mappersChangeSet}
		message: commitMessage
		additionalParents: {}
		onlyAdditionalParents: false.