initialize-release
initialize
	ids := IdentityDictionary new.
	referrers := IdentityDictionary new.
	reflections := IdentityDictionary new.
	additions := Dictionary new.
	removals := Dictionary new.
	conflicts := Dictionary new.
	merges := Dictionary new.