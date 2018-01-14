*Squot
beCurrentDuring: aBlock
	"Evaluate aBlock with me as the current dynamic Environment"
	^ aBlock on: CurrentEnvironment do: [:e | e resume: self]