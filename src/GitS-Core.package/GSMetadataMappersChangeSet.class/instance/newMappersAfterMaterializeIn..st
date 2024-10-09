accessing
newMappersAfterMaterializeIn: aWorkingCopy
	^ self newMappersWithRemovalCheck: [:changeSet | 
		changeSet canMapperBeRemovedAfterMaterializeIn: aWorkingCopy]