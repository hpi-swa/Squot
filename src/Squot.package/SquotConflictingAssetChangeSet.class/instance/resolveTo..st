resolving
resolveTo: anObject
	self
		resolution: anObject;
		resolve.
	{#isResolvedToBase. #isResolvedToLeft. #isResolvedToRight}
		do: [:each | self changed: each].