copying
copyWithDifferentContent: content
	^ (SquotArtifact newFrom: self)
		postCopyWithoutContent;
		content: content;
		yourself