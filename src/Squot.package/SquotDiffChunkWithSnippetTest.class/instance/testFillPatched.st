testing
testFillPatched
	| chunkWithSnippet patched |
	chunkWithSnippet := SquotDiffChunkWithSnippet
		chunk: (DiffChunk offset: 2 length: 2) -> (DiffChunk offset: 3 length: 2)
		snippet: #(2 3) -> #(1 2).
	patched := Array new: 4.
	"when"
	chunkWithSnippet fillPatched: patched.
	"then"
	self assert: patched = #(nil nil 1 2).