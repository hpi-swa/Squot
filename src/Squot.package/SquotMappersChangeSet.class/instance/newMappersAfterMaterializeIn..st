accessing
newMappersAfterMaterializeIn: aWorkingCopy
	^ self newMappersWithRemovalCheck: [:mapper | 
		mapper canMapperBeRemovedAfterMaterializeIn: aWorkingCopy]