changes-creation
changeSetFromAssetFile: anAssetFile toAssetFile: anotherAssetFile
	(anAssetFile = anotherAssetFile) ifTrue: [^ GSEmptyChangeSet withMapper: self].
	^ self changeSetClass withMapper: self from: anAssetFile to: anotherAssetFile