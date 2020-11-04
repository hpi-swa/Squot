*Squot-Tools
asDiffTree
	| node |
	node := SquotDiffNode title: self diffTreeNodeTitle content: self children: self topNodes
		onInclude: [willBeLoaded := true] onExclude: [willBeLoaded := false].
	node withAllChildren do: [:each | each artifactDiff: self].
	^ node