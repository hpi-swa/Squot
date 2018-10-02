private
synthesizedOriginalLoadOrder
	| loadOrder |
	loadOrder := self synthesizedLoadOrderCollection.
	loadOrderDiffChunksWithSnippets do: [:each | each fillOriginal: loadOrder].
	^ loadOrder