changes-creation
changeSetsFromMappers: fromMappersCollection toMappers: toMappersCollection old: oldBlock common: commonBlock new: newBlock
	| emptyCommit |
	emptyCommit := self emptyCommit.
	^ Array streamContents: [:stream |
		(fromMappersCollection difference: toMappersCollection) do: [:old |
			stream nextPut: (oldBlock value: old value: emptyCommit)].
		(toMappersCollection intersection: fromMappersCollection) do: [:common |
			stream nextPut: (commonBlock value: common)].
		(toMappersCollection difference: fromMappersCollection) do: [:new |
			stream nextPut: (newBlock value: new value: emptyCommit)]]