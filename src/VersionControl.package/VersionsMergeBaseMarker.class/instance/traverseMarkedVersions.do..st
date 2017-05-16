private
traverseMarkedVersions: aCollection do: aBlock
	versionsQueue := OrderedCollection withAll: aCollection.
	[versionsQueue anySatisfy: [:each | each reachableFromCommonAncestor not]] whileTrue:
		[ | version |
		version := versionsQueue removeFirst.
		aBlock value: version]