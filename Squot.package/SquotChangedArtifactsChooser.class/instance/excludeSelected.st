operations
excludeSelected
	(list at: selectedIndex) value: (self originalOf: self selectedArtifact).
	self listChanged.