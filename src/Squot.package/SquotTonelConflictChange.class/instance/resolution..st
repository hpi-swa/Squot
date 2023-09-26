accessing
resolution: aDefinition
	resolution := aDefinition.
	self updateTexts.
	{#isResolvedToBase. #isResolvedToLeft. #isResolvedToRight}
		do: [:each | self changed: each].