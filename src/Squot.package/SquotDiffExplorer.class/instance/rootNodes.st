ui diff tree
rootNodes
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := Array streamContents: [:stream |
		patch diffsDo: [:each | | root |
			each hasChanges ifTrue: "Does not make sense to display SquotArtifactLoads when not loading."
				[root := each asDiffTree.
				root withAllChildren do: [:eachNode | eachNode workingCopy: workingCopy].
				stream nextPut: root]]].
	^ rootNodes