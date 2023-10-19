loading
loadAsset: aStringOrPath ofType: aClass
	| asset |
	asset := self loadAsset: aStringOrPath.
	self
		assert: (asset isKindOf: aClass)
		description: ('Expected to find a ''{1}'' but found {2} while loading asset ''{3}''.'
						format: {aClass name. asset. aStringOrPath}).
	^ asset