testing
testEqualRectangles
	| diff rect origin corner |
	origin := 1@2.
	corner := 3@4.
	rect := (origin corner: corner).
	diff := self diff: rect against: rect copy.
	self deny: diff squotHasChanges.