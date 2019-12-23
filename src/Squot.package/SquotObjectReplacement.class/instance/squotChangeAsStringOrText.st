*Squot-Tools
squotChangeAsStringOrText
	^ TextDiffBuilder
		buildDisplayPatchFrom: (left ifNil: ['']) asString
		to: (right ifNil: ['']) asString
	