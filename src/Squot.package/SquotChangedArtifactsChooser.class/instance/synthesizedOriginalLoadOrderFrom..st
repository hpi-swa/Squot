private
synthesizedOriginalLoadOrderFrom: chunksAndSnippetsCollection
	| loadOrder |
	loadOrder := self synthesizedLoadOrderCollectionFrom: chunksAndSnippetsCollection.
	chunksAndSnippetsCollection do: [:each | each fillOriginal: loadOrder].
	^ loadOrder