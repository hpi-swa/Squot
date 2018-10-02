private
synthesizedSelectedLoadOrder
	| loadOrder |
	loadOrder := self synthesizedLoadOrderCollection.
	loadOrderDiffChunksWithSnippets do: [:each | each fillPatched: loadOrder].
	^ loadOrder