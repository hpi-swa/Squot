private
restoreCurrentAncestryAfter: aBlock
	| loadedVersion preservedAdditionalParents |
	loadedVersion := self loadedVersion.
	preservedAdditionalParents := additionalParents.
	aBlock ensure:
		["restore working copy state modified during the merge"
		additionalParents := preservedAdditionalParents.
		self loadedVersion: loadedVersion].