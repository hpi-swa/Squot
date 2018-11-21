initialize-release
startingFrom: anObjectContainer
	artifacts := anObjectContainer artifacts copy. "path -> artifact"
	loadOrder := OrderedCollection withAll: anObjectContainer loadOrder. "paths"