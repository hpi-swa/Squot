accessing snapshot
parentSnapshot
	"Answer the snapshot of the first parent, if there is one, or otherwise an empty snapshot"
	^ (self parents ifEmpty: [^ SquotSnapshot empty]) first snapshot