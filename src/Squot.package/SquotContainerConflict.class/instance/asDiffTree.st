converting
asDiffTree
	^ (SquotMergeDiffNode newFrom: incoming asDiffTree)
		includeBlock: [self chooseIncoming];
		excludeBlock: [self chooseWorking];
		resetBlock: [self resetChoice];
		yourself