guessing
artifactLocators
	| locators |
	locators := OrderedCollection new.
	(Pragma allNamed: #squotArtifactLocatorFor:priority: from: self class to: self class)
		do: [:each | locators add: (self perform: each selector)].
	^ locators