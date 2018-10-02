testing
testMaxIndex3
	| chunkWithSnippet maxIndex |
	chunkWithSnippet := SquotDiffChunkWithSnippet
		chunk: (DiffChunk offset: 1 length: 3) -> (DiffChunk offset: 3 length: 2)
		snippet: #(1 2 3) -> #(1 2).
	"when"
	maxIndex := chunkWithSnippet maxIndex.
	"then"
	self assert: maxIndex = 4.