accessing snapshot
parentSnapshot
	"Answer the snapshot of the first parent, if there is one, or otherwise an empty snapshot"
	^ (self parents ifEmpty: [^ SquotToggles useNewApi ifTrue: [SquotProjectSnapshot empty] ifFalse: [SquotSnapshot empty]]) first snapshot