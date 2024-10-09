accessing
setChangeFrom: aString to: anotherString
	self change: (GSMetadataNameNormalChange
					withChangeSet: self
					from: aString
					to: anotherString).