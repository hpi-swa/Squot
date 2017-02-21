writing
writePackageDefinition: aMCOrganizationDefinition 
	aMCOrganizationDefinition categories do: [ :category|
		(self reference / category) ensureDirectory].