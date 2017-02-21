operations
processCreations
	"create the deepest trees first to avoid regenration of signatures of the parent trees"
	| paths|
	paths := (createdPaths associations sorted: [ :assoc1 :assoc2 |
		assoc2 value maxDepth <= assoc1 value maxDepth ]).
	paths do: [ :assoc |
		self processCreationOf: assoc value from: assoc key]