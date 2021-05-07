private
computeDifferences
	self flag: #deprecated. 'Compute differences in the caller and use full constructor for the merge instead'.
	graphMerge := working diffContentAgainstThatOf: incoming withBase: base.
	metadataMerge := working storeInfo squotMergeWith: incoming storeInfo basedOn: base storeInfo.