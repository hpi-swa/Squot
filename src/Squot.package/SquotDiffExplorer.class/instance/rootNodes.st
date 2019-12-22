ui diff tree
rootNodes
	rootNodes ifNotNil: [^ rootNodes].
	rootNodes := Array streamContents: [:stream |
		patch diffsDo: [:each | | root |
			root := each asDiffTree.
			root withAllChildren do: [:eachNode | eachNode workingCopy: workingCopy].
			stream nextPut: root]].
	^ rootNodes