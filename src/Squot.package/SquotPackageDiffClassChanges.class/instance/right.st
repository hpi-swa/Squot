browsing
right
	^ self classShadowFromArtifact:
		((diffTreeNode artifactDiff respondsTo: #conflicts)
			ifTrue: [diffTreeNode artifactDiff incoming]
			ifFalse: [diffTreeNode artifactDiff right])