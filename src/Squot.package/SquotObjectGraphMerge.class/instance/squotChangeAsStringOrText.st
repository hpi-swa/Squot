*Squot-Tools
squotChangeAsStringOrText
	| text |
	text := WriteStream on: (Text new: 30).
	({{containerConflicts. 'Conflicts:'}.
	{containerModifications. 'Modifications:'}.
	{elementMerges. 'Merges:'}}
		select: [:eachPair | eachPair first notEmpty])
		do: [:eachPair |
			text nextPutAll: (eachPair second asText addAttribute: TextEmphasis italic);
				cr; cr.
			eachPair first do:
				[:each |
				text nextPutAll:
					(each squotChangeAsStringOrText asText addAttribute: (TextIndent amount: 1));
					cr]]
		separatedBy: [text cr].
	^ text contents