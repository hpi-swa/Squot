initialize-release
initialize
	original := Dictionary new.
	proposed := Dictionary new.
	effective := Dictionary new.
	list := Array empty.
	ignored := Dictionary new. "path -> nil or concrete artifact"
	selection := 0.