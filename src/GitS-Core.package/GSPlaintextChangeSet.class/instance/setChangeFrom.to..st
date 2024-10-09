accessing
setChangeFrom: anAssetFile to: anotherAssetFile
	self change: (GSPlaintextNormalChange
					withChangeSet: self
					from: anAssetFile
					to: anotherAssetFile).