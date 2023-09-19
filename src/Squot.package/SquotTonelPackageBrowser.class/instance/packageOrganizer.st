accessing
packageOrganizer
	^ packageOrganizer ifNil: [self packageOrganizer: PackageOrganizer default. packageOrganizer]