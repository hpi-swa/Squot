as yet unclassified
ignoredInstanceVariablesIn: anObject
	^ self value
		ifNil: [#()]
		ifNotNil: [:trackedObjectMetadata |
			trackedObjectMetadata ignoredInstanceVariablesIn: anObject]