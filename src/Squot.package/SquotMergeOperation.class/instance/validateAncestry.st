applying
validateAncestry
	mergeVersion ifNil: [self error: 'Version to merge not configured'].
	baseVersion ifNil: [self error: 'Common ancestor version not configured'].
	mergeBases := self workingVersion mergeBasesWith: mergeVersion.
	(mergeBases includes: mergeVersion) ifTrue:
		[self error: 'Version to merge is already an ancestor of the working copy'].
	