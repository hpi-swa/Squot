copying
postCopy
	metadata := metadata veryDeepCopy.
	artifacts := artifacts copy.
	artifacts replace: [:each | each copy].