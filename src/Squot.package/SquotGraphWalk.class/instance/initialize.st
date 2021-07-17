initialize-release
initialize
	visited := IdentitySet new.
	toBeVisited := OrderedCollection new.
	paths := IdentityDictionary new.
	referrers := Dictionary new.
	trackReferrers := true.
	breadthFirst := false.
	history := OrderedCollection new.
	numberOfPathChecks := 0.