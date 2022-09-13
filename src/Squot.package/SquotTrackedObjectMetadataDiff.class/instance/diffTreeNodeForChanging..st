*Squot-Tools-Diffs
diffTreeNodeForChanging: key
	| diff path |
	path := {SquotDictionaryEntry key: key}.
	diff := diffs at: path.
	^ SquotDiffNode
		title: 'Set ', key, ' to ', (right at: key) printString
		content: nil
		children: #()
		onInclude: [diffs at: path put: diff]
		onExclude: [diffs removeKey: path]