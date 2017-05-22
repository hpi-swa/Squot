testing
testWithSink
	| version1 version2 version3 version4 list |
	version1 := self newVersion: '1' withParents: #().
	version2 := self newVersion: '2' withParents: {version1}.
	version3 := self newVersion: '3' withParents: {version2}.
	version4 := self newVersion: '4' withParents: {version3}.
	"when"
	walker excludeAncestorsOf: version1.
	list := walker startingFrom: version4.
	"then"
	self assert: (list asArray = {version4. version3. version2})