tests
testWalkToFindDifference2
	| list |
	"git rev-list version3..version5
	---> version[4,5]"
	list := walk nextPut: (versions at: 5); upTo: (versions at: 3).
	"then"
	self deny: (list includes: (versions at: 2));
		deny: (list includes: (versions at: 1)).
	self assert: list asBag = (versions atAll: #(4 5)) asBag.
	"TODO: assert something about the order"