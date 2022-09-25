legacy
createNewBuilder
	"Emulate SquotPatchBuilder protocol"
	self flag: #deprecated.
	^ SquotLegacySnapshotBuilderAdapter startingFrom: self