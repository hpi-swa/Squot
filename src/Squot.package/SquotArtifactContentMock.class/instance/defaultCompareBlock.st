configuring
defaultCompareBlock
	^ [:other :this | self error: self printString, ' not configured for diff']