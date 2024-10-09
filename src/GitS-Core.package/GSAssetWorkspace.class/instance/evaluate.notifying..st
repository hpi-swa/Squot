evaluation
evaluate: aString notifying: requestor
	| asset |
	asset := self
				evaluate: aString
				notifying: requestor
				ifFail: [self inform: 'evaluating failed'. ^ false].
	(asset isNil or: [self isValidAsset: asset]) ifFalse: [
		self inform: 'evaluation did not produce a ', self assetOrNilTypeName.
		^ false].
	self asset: (self transformAsset: asset ifFail: [^ false]).
	self addBindings.
	^ true