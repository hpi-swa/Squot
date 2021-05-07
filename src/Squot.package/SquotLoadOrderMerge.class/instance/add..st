patching
add: aSquotArtifact
	| path |
	"Note the addition and insert after all items that precede it in the incoming order."
	path := aSquotArtifact path.
	self assert: (editedWorking includes: path) not.
	self insert: path into: editedWorking afterPredecessorsIn: incoming.
	self resetResolution