results
selectedPatch
	self accepted ifFalse: [^ SquotPatch empty].
	^ editedPatch buildPatch