ui diff tree
createNodesForUnloaded
	"Seek out all unmodified artifacts that are unloaded on the left side and could be loaded now."
	^ ((editedPatch unloadedArtifactsFromLeft
		select: [:eachUnloaded | rootNodes 	noneSatisfy: [:eachRoot | eachRoot artifactDiff notNil and: [eachRoot artifactDiff path = eachUnloaded path]]])
		select: [:each | each isLoadable])
		collect:
			[:each | | load node |
			load := SquotArtifactLoad of: each.
			editedPatch addDiff: load.
			node := load asDiffTree.
			node withAllChildren do: [:eachNode | eachNode exclude "by default"].
			node]