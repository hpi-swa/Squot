guessing
guessArtifacts
	"Search the files and directories for known patterns that indicate certain types of objects
	stored there."
	| artifacts |
	artifacts := OrderedCollection new.
	(Pragma allNamed: #squotArtifactLocatorFor:priority: from: self class to: self class)
		do: [:each | artifacts addAll: (self perform: each selector)].
	^ artifacts collect: [:each | each path -> each] as: Dictionary