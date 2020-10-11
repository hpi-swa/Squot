accessing objects
artifacts
	| artifacts |
	artifacts := Dictionary new.
	artifacts addAll: (self unloadedArtifacts collect: [:each | SquotUnloadedArtifact wrapping: each in: self]).
	artifacts addAll: (store artifacts collect: [:each | SquotLoadedArtifact wrapping: each in: self]).
	^ artifacts