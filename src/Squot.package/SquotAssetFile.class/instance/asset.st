accessing
asset
	^ asset ifNil: [asset := self readAsset]