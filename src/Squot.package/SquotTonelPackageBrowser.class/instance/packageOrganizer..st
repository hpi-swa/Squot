accessing
packageOrganizer: aPackageOrganizer
	packageOrganizer ifNotNil: [packageOrganizer removeDependent: self].
	packageOrganizer := aPackageOrganizer.
	packageOrganizer ifNotNil: [packageOrganizer addDependent: self].