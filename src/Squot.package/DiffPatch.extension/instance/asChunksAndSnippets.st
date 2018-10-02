*Squot-diff-converting
asChunksAndSnippets
	^ chunks with: snippets
		collect: 	[:eachChunk :eachSnippet |
					SquotDiffChunkWithSnippet chunk: eachChunk snippet: eachSnippet]