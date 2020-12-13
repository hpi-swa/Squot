private
computeDifferences
	graphMerge := working diffContentAgainstThatOf: incoming withBase: base.
	metadataMerge := working storeInfo squotMergeWith: incoming storeInfo basedOn: base storeInfo. self flag: #encapsulation. self flag: #generality. "Should artifacts be able to influence this further?"