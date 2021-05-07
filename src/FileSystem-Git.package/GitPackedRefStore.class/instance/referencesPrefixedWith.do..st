enumerating
referencesPrefixedWith: prefixString do: aBlock
	(self packedRefs prefixedWith: prefixString)
		collect: [:each | each name]
		thenDo: aBlock.