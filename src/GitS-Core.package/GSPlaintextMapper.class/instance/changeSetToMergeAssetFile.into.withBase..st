changes-creation
changeSetToMergeAssetFile: right into: left withBase: base
	^ GSMergeUtilities
		stringOrNilMergeLeft: (left ifNotNil: #asset)
		right: (right ifNotNil: #asset)
		base: (base ifNotNil: #asset)
		ifUnchanged: [GSEmptyChangeSet withMapper: self]
		ifMerged: [:merged | GSPlaintextChangeSet withMapper: self from: left to: (self assetAsAssetFile: (self transformAsset: merged))]
		ifConflict: [:conflict | GSPlaintextChangeSet withMapper: self conflict: (conflict collect: [:each | self assetAsAssetFile: each])]