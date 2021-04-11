materializing
asMaterializedReference
	^ SquotEntangledMaterializedReference
		materialized: actualReference asMaterializedReference
		entangled: self