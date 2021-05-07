Squot repository
createNewVersionFromPatch: aPatch with: aBlock
	^ (SquitVersionBuilder repository: self)
		patch: aPatch;
		in: aBlock;
		buildVersion.