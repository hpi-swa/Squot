private
followReferences
	walk do: [:each | self followReferencesOf: each].