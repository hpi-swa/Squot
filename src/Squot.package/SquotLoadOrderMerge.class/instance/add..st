patching
add: aSquotArtifact
	| id |
	"Note the addition and insert after all items that precede it in the incoming order."
	id := SquotToggles useNewApi ifTrue: [aSquotArtifact id] ifFalse: [aSquotArtifact path].
	self assert: (result includes: id) not.
	self insert: id into: result afterPredecessorsIn: incoming.
	self resetResolution