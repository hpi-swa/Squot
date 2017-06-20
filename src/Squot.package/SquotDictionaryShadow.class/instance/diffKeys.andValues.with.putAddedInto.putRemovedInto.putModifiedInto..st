as yet unclassified
diffKeys: leftKeys andValues: leftValues with: aDiffBuilder
putAddedInto: added
putRemovedInto: removed
putModifiedInto: modified
	| left right addedKeys removedKeys |
	left := Dictionary newFrom: (leftKeys with: leftValues collect: [:key :value | key -> value]).
	right := Dictionary newFrom: (keys with: values collect: [:key :value | key -> value]).
	addedKeys := (keys withIndexCollect: [:each :index | each -> index])
		reject: [:each | leftKeys includes: each key].
	removedKeys := (leftKeys withIndexCollect: [:each :index | each -> index])
		reject: [:each | keys includes: each key].
	addedKeys do: [:each | added
			at: each key
			put: (aDiffBuilder onlyRight: (values at: each value))].
	removedKeys do: [:each | removed
			at: each key
			put: (aDiffBuilder onlyLeft: (leftValues at: each value))].
	((keys withIndexCollect: [:each :index | each -> index]) copyWithoutAll: addedKeys)
		do: [:each | modified
				at: each key
				put: (aDiffBuilder left: (left at: each key) right: (values at: each value))]