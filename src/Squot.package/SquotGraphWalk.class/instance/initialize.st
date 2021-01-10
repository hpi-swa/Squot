initialize-release
initialize
	visited := IdentitySet new.
	toBeVisited := OrderedCollection new.
	paths := Dictionary new.
	referrers := Dictionary new.