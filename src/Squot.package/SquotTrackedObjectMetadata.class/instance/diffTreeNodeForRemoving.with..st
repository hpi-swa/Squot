*Squot-Tools private
diffTreeNodeForRemoving: key with: value
	^ SquotDiffNode
		title: 'Unset ', key
		content: nil
		children: #()
		onInclude: [self removeKey: key]
		onExclude: [self at: key put: value]