configuring
whenInitializingStoreInfoFor: anObject do: aBlock
	storeInfoInitBlocks ifNil: [storeInfoInitBlocks := IdentityDictionary new].
	storeInfoInitBlocks at: anObject put: aBlock.