updating
update: anObject
	super update: anObject.
	anObject = #mappers ifTrue: [self changed: #assetList].
	anObject = #materialized ifTrue: [self changed: #buildAssetPanel:]