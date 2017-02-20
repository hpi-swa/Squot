copying
copyWithDifferentContent: newContent
	^ self shallowCopy
		postCopyWithoutContent;
		content: newContent;
		yourself