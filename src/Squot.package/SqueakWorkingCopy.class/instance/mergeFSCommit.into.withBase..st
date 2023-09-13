git-operations
mergeFSCommit: rightFSCommit into: leftFSCommit withBase: baseFSCommit
	| emptyCommit combinedMappers |
	emptyCommit := self emptyCommit.
	combinedMappers := Dictionary new.
	{rightFSCommit. leftFSCommit. baseFSCommit} withIndexDo: [:commit :index | 
		(self readMappersFileFromFSCommit: commit) do: [:mapper |
			(combinedMappers at: mapper ifAbsentPut: [{emptyCommit. emptyCommit. emptyCommit}])
				at: index put: commit]].
	^ Array streamContents: [:stream |
		combinedMappers keysAndValuesDo: [:mapper :commits |
			stream nextPut: (mapper mergeCommit: commits first into: commits second withBase: commits third)]]