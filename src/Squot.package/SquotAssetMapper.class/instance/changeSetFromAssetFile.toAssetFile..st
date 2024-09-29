changes-creation
changeSetFromAssetFile: anAssetFile toAssetFile: anotherAssetFile
	(anAssetFile = anotherAssetFile) ifTrue: [^ SquotEmptyChangeSet withMapper: self].
	^ self changeSetClass withMapper: self from: anAssetFile to: anotherAssetFile