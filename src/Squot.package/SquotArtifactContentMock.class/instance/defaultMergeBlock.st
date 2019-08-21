configuring
defaultMergeBlock
	^ [:other :base :this | self error: self printString, ' not configured for merge']