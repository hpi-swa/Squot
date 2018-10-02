private
adjustLoadOrder: aPatchBuilder
	| chunksAndSnippets |
	chunksAndSnippets := editedPatch loadOrderDiff asChunksAndSnippets.
	aPatchBuilder
		originalLoadOrder: (self synthesizedOriginalLoadOrderFrom: chunksAndSnippets);
		newLoadOrder: (self synthesizedSelectedLoadOrderFrom: chunksAndSnippets).