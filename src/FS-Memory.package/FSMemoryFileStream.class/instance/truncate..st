writing
truncate: aPosition
	position := position min: aPosition.
	"bytes in the MemoryStore are replaced with my collection up to position anyway"