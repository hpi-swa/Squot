operations
includeSelected
	(list at: selectedIndex) value: (self proposedOf: self selectedArtifact).
	self listChanged.