configuring
defaultMergeBlock
	^ [:other :this | self error: self printString, ' not configured for merge']