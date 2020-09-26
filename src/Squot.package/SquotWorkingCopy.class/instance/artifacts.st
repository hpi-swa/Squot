accessing objects
artifacts
	| artifacts |
	artifacts := Dictionary new.
	artifacts addAll: self unloadedArtifacts.
	artifacts addAll: store artifacts.
	^ artifacts collect: [:each | SquotLoadedArtifact wrapping: each in: self]