ui
selectedArtifact
	^ (list at: selectedIndex ifAbsent: [^ nil]) value