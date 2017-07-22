as yet unclassified
replacementForSlot: aShadowSlot in: anObject ifFound: unaryBlock ifNone: noneBlock
	^ self value
		ifNil: [noneBlock value]
		ifNotNil: [:trackedObjectMetadata |
			trackedObjectMetadata
				slotOverrideFor: aShadowSlot in: anObject
				ifFound: unaryBlock ifNone: noneBlock]