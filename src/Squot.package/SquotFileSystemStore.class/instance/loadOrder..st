accessing
loadOrder: aCollection
	| artifacts |
	artifacts := self artifacts. "according to the existing table of contents"
	self tableOfContents removeAll.
	aCollection do: [:each | self tableOfContents add: (artifacts at: each)].