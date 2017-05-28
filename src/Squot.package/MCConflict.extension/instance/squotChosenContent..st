*Squot
squotChosenContent: leftRightOrBase
	^ leftRightOrBase caseOf:
		{[#left] -> [nil].
		[#right] -> [self operation].
		[#base] -> [self notYetImplemented]}