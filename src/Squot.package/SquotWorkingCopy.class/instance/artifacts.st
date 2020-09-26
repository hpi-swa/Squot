accessing objects
artifacts
	| artifacts |
	artifacts := Dictionary new.
	artifacts addAll: self unloadedArtifacts.
	artifacts addAll: store artifacts.
	^ artifacts collect: [:each | SquotWorkingCopyArtifact wrapping: each in: self]