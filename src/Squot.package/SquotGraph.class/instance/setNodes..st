initialize-release
setNodes: aCollection
	nodes := aCollection asArray.
	index := Dictionary new.
	nodes withIndexDo: [:each :i | index at: each put: i].
	edges := nodes collect: [:each | OrderedCollection new].