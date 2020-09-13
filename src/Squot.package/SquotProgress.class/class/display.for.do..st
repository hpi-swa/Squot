instance creation
display: aStringOrBlock for: aCollection do: aBlock
	"SquotProgress display: [:aClass | 'Processing ', aClass name]
		for: Smalltalk allClasses 	do: [:aClass| (Delay forMilliseconds: 1) wait]."
	^ self new
		display: aStringOrBlock for: aCollection do: aBlock