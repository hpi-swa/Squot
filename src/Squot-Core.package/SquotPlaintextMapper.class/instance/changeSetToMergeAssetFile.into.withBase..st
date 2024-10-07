merging
changeSetToMergeAssetFile: right into: left withBase: base
	^ SquotMergeUtilities
		stringOrNilMergeLeft: (left ifNotNil: #asset)
		right: (right ifNotNil: #asset)
		base: (base ifNotNil: #asset)
		ifUnchanged: [SquotEmptyChangeSet withMapper: self]
		ifMerged: [:merged | SquotPlaintextChangeSet withMapper: self from: left to: (self assetAsAssetFile: (self transformAsset: merged))]
		ifConflict: [:conflict | SquotPlaintextChangeSet withMapper: self conflict: (conflict collect: [:each | self assetAsAssetFile: each])]