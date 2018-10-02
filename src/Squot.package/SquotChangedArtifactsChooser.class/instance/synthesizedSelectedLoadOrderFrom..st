private
synthesizedSelectedLoadOrderFrom: chunksAndSnippetsCollection
	| loadOrder |
	loadOrder := self synthesizedLoadOrderCollectionFrom: chunksAndSnippetsCollection.
	chunksAndSnippetsCollection do: [:each | each fillPatched: loadOrder].
	^ loadOrder