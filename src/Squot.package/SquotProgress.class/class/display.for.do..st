instance creation
display: aStringOrBlock for: aCollection do: aBlock
	"SquotProgress display: [:aClass | 'Processing ', aClass name]
		for: (Smalltalk allClasses first: 20) do: [:aClass| (Delay forMilliseconds: 100) wait]."
	^ self new
		display: aStringOrBlock for: aCollection do: aBlock