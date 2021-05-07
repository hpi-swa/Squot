tests
testWalkToFindSymmetricDifference
	| list |
	"git rev-list version3...version5
	 ---> version[2,3,4,5]"
	"when"
	list := walk nextPutAll: (versions atAll: #(3 5)); upTo: "merge base" (versions at: 1).
	"then"
	self deny: (list includes: (versions at: 1)).
	self assert: list asBag = (versions atAll: #(2 3 4 5)) asBag.