testing
testMaxIndex1
	| chunkWithSnippet maxIndex |
	chunkWithSnippet := SquotDiffChunkWithSnippet
		chunk: (DiffChunk offset: 5 length: 1) -> (DiffChunk offset: 5 length: 2)
		snippet: #(1) -> #(1 2).
	"when"
	maxIndex := chunkWithSnippet maxIndex.
	"then"
	self assert: maxIndex = 6.