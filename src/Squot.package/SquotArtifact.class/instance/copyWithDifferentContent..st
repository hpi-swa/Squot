copying
copyWithDifferentContent: newContent
	SquotToggles useNewApi ifTrue:
		[self flag: #deprecated.
		^ SquotArtifactSnapshot artifact: self copy objectSnapshot: newContent].
	^ self shallowCopy
		postCopyWithoutContent;
		content: newContent;
		yourself