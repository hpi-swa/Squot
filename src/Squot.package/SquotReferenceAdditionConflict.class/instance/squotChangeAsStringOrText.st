*Squot-Tools
squotChangeAsStringOrText
	^ 'Distinct objects', String cr,
		(TextDiffBuilder buildDisplayPatchFrom: working printString to: incoming printString)