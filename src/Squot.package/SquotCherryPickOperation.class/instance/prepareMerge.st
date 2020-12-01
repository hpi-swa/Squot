applying
prepareMerge
	"Compute the merge and answer it (not the merge operation)."
	^ self withUnitOfWorkActive:
		[self validateAncestry.
		(merge := self privateNewMerge)
			unitOfWork: self unitOfWork;
			doNotAddParent;
			workingCopySnapshot: self workingCopySnapshot;
			mergeVersion: pickedVersion;
			baseVersion: relevantParentOfPickedVersion;
			title: 'Cherry-pick ', pickedVersion asString;
			requestor: self.
		merge prepare]