actions on versions
actionCommitDiffWithParent
	self withUnitOfWork:
		[| label parent parents |
		parents := self commitSelection parents.
		label := 'Comparing versions'.
		parent := parents
			ifNotEmpty:
				[parents size = 1
					ifTrue: [parents anyOne]
					ifFalse:
						[(SquotGUI chooseFrom: parents values: parents title: 'Choose parent for diff')
							ifNil: [^ self]]]
			ifEmpty:
				[label := '{1} (orphan commit)' format: {label}.
				SquotSnapshot empty].
		(SquotDiffExplorer
			from: parent
			to: self commitSelection)
		workingCopy: self projectSelection;
		openLabel: label].