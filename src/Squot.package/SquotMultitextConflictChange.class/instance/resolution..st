accessing
resolution: anObject
	resolution := anObject.
	self updateTexts.
	{#isResolvedToBase. #isResolvedToLeft. #isResolvedToRight}
		do: [:each | self changed: each].