accessing
setChangeFrom: anAssetFile to: anotherAssetFile
	self change: (SquotPlaintextNormalChange
					withChangeSet: self
					from: anAssetFile
					to: anotherAssetFile).