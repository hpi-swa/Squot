testing
testFillOriginal
	| chunkWithSnippet original |
	chunkWithSnippet := SquotDiffChunkWithSnippet
		chunk: (DiffChunk offset: 2 length: 2) -> (DiffChunk offset: 3 length: 2)
		snippet: #(2 3) -> #(1 2).
	original := Array new: 4.
	"when"
	chunkWithSnippet fillOriginal: original.
	"then"
	self assert: original = #(nil 2 3 nil).