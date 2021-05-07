private
mergeBases
	^ self workingVersion
		ifNil: [#()]
		ifNotNil: [:head | head mergeBasesWith: mergeVersion]