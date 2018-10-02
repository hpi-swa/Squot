testing
testMaxIndex2
	| chunkWithSnippet maxIndex |
	chunkWithSnippet := SquotDiffChunkWithSnippet
		chunk: (DiffChunk offset: 1 length: 3) -> (DiffChunk offset: 1 length: 2)
		snippet: #(1 2 3) -> #(4 5).
	"when"
	maxIndex := chunkWithSnippet maxIndex.
	"then"
	self assert: maxIndex = 3.