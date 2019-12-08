accessing objects
lazySnapshot
	"Answer a new snapshot whose artifacts are captured on demand."
	| artifacts builder |
	builder := SquotSnapshot builder.
	artifacts := self artifacts.
	self loadOrder do: [:each | builder add: (artifacts at: each)].
	^ builder buildSnapshot