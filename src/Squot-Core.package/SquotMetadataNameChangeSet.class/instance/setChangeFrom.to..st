accessing
setChangeFrom: aString to: anotherString
	self change: (SquotMetadataNameNormalChange
					withChangeSet: self
					from: aString
					to: anotherString).