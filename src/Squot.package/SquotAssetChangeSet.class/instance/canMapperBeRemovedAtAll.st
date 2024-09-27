testing
canMapperBeRemovedAtAll
	^ self isIncluded and: [self mapper canBeRemovedForVersion: self versionToWrite]