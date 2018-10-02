private
synthesizedLoadOrderCollection
	| maxIndex |
	loadOrderDiffChunksWithSnippets ifEmpty: [^ Array empty].
	maxIndex := (loadOrderDiffChunksWithSnippets collect: [:each | each maxIndex]) max.
	^ RunArray new: maxIndex. "assuming sparse occupancy"