geometry
extent: aPoint
	super extent: (aPoint x min: aPoint y) asPoint. "ensure square"
	self
		updateLayoutInset;
		updateButton.