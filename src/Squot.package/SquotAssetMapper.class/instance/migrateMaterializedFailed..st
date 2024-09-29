migrations
migrateMaterializedFailed: anObject
	self inform:
		'Found unrecognized object in place of materialized asset.
		An inspector will open and the asset will be marked as ''missing''.'
			withoutLineEndings withBlanksCondensed.
	anObject inspect.
	^ nil