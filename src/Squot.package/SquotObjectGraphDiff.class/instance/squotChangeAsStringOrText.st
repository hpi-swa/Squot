*Squot-Tools
squotChangeAsStringOrText
	diffs ifEmpty: [^ ''].
	^ (diffs at: startObjectName) squotChangeAsStringOrText