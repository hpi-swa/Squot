accessing
newMappersAfterSerializeInto: aFileSystem
	^ self newMappersWithRemovalCheck: [:mapper | 
		mapper canMapperBeRemovedAfterSerializeInto: aFileSystem]