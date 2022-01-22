applying
prepareMerge
	"Compute the merge and answer it (not the merge operation)."
	^ self withUnitOfWorkActive:
		[self validateAncestry.
		(merge := self privateNewMerge)
			unitOfWork: self unitOfWork;
			doNotAddParent;
			workingCopySnapshot: self workingCopySnapshot;
			"This is like a reversed cherry-pick:"
			mergeVersion: relevantParentOfRevertedVersion;
			baseVersion: revertedVersion;
			title: 'Revert ', revertedVersion asString;
			requestor: self.
		merge prepare]