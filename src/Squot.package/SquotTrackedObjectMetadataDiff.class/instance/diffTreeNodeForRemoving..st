*Squot-Tools-Diffs
diffTreeNodeForRemoving: key
	| diff path |
	path := {SquotDictionaryEntry key: key}.
	diff := diffs at: path.
	^ SquotDiffNode
		title: 'Unset ', key
		content: nil
		children: #()
		onInclude: [diffs at: path put: diff]
		onExclude: [diffs removeKey: path]