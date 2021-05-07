tests
testWalkToFindDifference
	| list |
	"git rev-list version2..version6
	---> version[3,4,5,6]"
	list := walk nextPut: (versions at: 6); upTo: (versions at: 2).
	"then"
	self deny: (list includes: (versions at: 2));
		deny: (list includes: (versions at: 1)).
	self assert: list asBag = (versions atAll: #(3 4 5 6)) asBag.
	"TODO: assert something about the order"