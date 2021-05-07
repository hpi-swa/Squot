*Squot-Tests-Tools
asDiffTree
	| node |
	node := SquotDiffNode title: self path content: self children: self topNodes
		onInclude: [] onExclude: [].
	node withAllChildren do: [:each | each artifactDiff: self].
	^ node