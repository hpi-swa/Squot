resolving
resolveTo: anAssetFile
	self
		resolution: anAssetFile;
		resolve.
	{#isResolvedToBase. #isResolvedToLeft. #isResolvedToRight}
		do: [:each | self changed: each].