as yet unclassified
anyChildNeedsChoice
	^ (SquotDiffNodeSearchForChoiceNeeded new
		searchFrom: self;
		nodeThatNeedsChoice) notNil