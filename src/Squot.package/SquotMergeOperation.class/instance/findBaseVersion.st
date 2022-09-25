private
findBaseVersion
	self assert: mergeBases notNil.
	mergeBases ifEmpty: [^ self nullBase "no commonalities"].
	(mergeBases includes: mergeVersion) ifTrue:
		[^ (SquotVersionAlreadyInHistory 
			historian: workingCopy activeHistorian
			version: mergeVersion) 
				signal: 'Version to be merged is already an ancestor of the working copy'].
	(mergeBases includes: self workingVersion) ifTrue:
		[^ self workingVersion].
	self flag: #stub. "If there are multiple merge-bases, a recursive merge should be attempted"
	^ mergeBases anyOne