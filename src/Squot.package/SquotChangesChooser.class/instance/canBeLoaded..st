ui menus
canBeLoaded: aDiffNode
	"Answer yes if the artifact of the node is currently not loaded, but could be loaded in the current operation (restore or merge)."
	| isNotLoaded |
	(aDiffNode isArtifactNode not or: [aDiffNode content isConflict]) ifTrue: [^ false].
	isNotLoaded := [:anArtifact | (anArtifact respondsTo: #isLoaded) and: [anArtifact isLoaded not]].
	^ aDiffNode artifactDiff isMerge
		ifTrue: [isNotLoaded value: aDiffNode artifactDiff working]
		ifFalse:
			[| diff | diff := aDiffNode artifactDiff.
			diff isAddition or: [diff isRemoval not and: [isNotLoaded value: diff left]]]