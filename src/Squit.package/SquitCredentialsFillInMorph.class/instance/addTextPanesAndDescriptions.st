initialization
addTextPanesAndDescriptions
	
	| otherMessageMorph |
	
	column := AlignmentMorph newColumn
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		cellGap: 4;
		color: Color transparent.
	self paneMorph addMorph: column.
	
	self message: 'GitHub username (authentication)'.

	column addMorphBack: textPaneUsername.
	
	otherMessageMorph := messageMorph copy.
	otherMessageMorph contents: 'GitHub password/token (authentication)'.
	column addMorphBack: otherMessageMorph.
	
	column addMorphBack: textPanePassword.
	
	otherMessageMorph := messageMorph copy.
	otherMessageMorph contents: 'Name (used for commits, e.g. Maria Muster)'.
	column addMorphBack: otherMessageMorph.
	
	column addMorphBack: textPaneDisplayName.
	
	otherMessageMorph := messageMorph copy.
	otherMessageMorph contents: 'Email (used for commits)'.
	column addMorphBack: otherMessageMorph.
	
	column addMorphBack: textPaneEmail.