visiting
visitCollection: aCollection
	aCollection do: [ :object | self visit: object ]