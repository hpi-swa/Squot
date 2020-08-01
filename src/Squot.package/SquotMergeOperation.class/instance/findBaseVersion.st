private
findBaseVersion
	mergeBases := self workingVersion
		ifNil: [#()]
		ifNotNil: [:head | head mergeBasesWith: mergeVersion].
	mergeBases ifEmpty: [^ SquotSnapshot empty "no commonalities"].
	(mergeBases includes: mergeVersion) ifTrue:
		[^ (SquotVersionAlreadyInHistory 
			historian: workingCopy loadedHistorian
			version: mergeVersion) 
				signal: 'Version to be merged is already an ancestor of the version to be merged'].
	(mergeBases includes: self workingVersion) ifTrue:
		[^ self workingVersion].
	self flag: #stub. "If there are multiple merge-bases, a recursive merge should be attempted"
	^ mergeBases anyOne