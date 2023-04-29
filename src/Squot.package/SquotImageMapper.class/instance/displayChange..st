changes-operations
displayChange: aChange
	^ AlignmentMorph newColumn
		addMorphBack: (StringMorph new contents: 'old');
		addMorphBack: aChange key asMorph;
		addMorphBack: (StringMorph new contents: 'new');
		addMorphBack: aChange value asMorph