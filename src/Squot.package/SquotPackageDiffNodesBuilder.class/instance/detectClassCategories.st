private
detectClassCategories
	| categoriesSet |
	categoriesSet := Set new.
	(packageMerge incoming definitions detect: #isOrganizationDefinition ifNone: []) ifNotNil:
		[:org |
		classCategories addAll: org categories.
		categoriesSet addAll: org categories].
	(packageMerge working definitions detect: #isOrganizationDefinition ifNone: []) ifNotNil:
		[:org | org categories
			do: [:each |
				(categoriesSet includes: each) ifFalse:
					[classCategories add: each.
					categoriesSet add: each]]].
	(packageMerge base definitions detect: #isOrganizationDefinition ifNone: []) ifNotNil:
		[:org | org categories
			do: [:each |
				(categoriesSet includes: each) ifFalse:
					[classCategories add: each.
					categoriesSet add: each]]].