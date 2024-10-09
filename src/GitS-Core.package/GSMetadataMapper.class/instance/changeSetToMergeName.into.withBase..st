changes-creation
changeSetToMergeName: rightString into: leftString withBase: baseString
	^ GSMergeUtilities
		atomicMergeLeft: leftString
		right: rightString
		base: baseString
		ifUnchanged: [nil]
		ifMerged: [:merged | GSMetadataNameChangeSet withMapper: self from: leftString to: merged]
		ifConflict: [:conflict | GSMetadataNameChangeSet withMapper: self conflict: conflict]