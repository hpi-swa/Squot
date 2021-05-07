private
restoreCurrentAncestryAfter: aBlock
	| version headVersion preservedAdditionalParents |
	version := self loadedVersion.
	headVersion := self baseVersion.
	preservedAdditionalParents := additionalParents.
	aBlock ensure:
		["restore working copy state modified during the merge"
		additionalParents := preservedAdditionalParents.
		self loadedHistorian version: headVersion.
		self loadedVersion: version].