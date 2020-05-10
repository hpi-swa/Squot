tests
testCorrectExclusionOfAncestorsThroughCorrectWalkOrder
	"The walk should enumerate all versions with the Git commit timestamp, not the author timestamp."
	"1 -- 4 ----/--- 2' -- 5 (top)
	    \-- 3 --/--- 6 (bottom)
	git rev-list 5..6 => (6), must not include 3.
	2' is a cherry pick of an older version and must not be enumerated before 5. because 5 is an ancestor of 3', 5 must have the earlier commit time."
	| result versions |
	(versions := OrderedCollection new)
		add: (self newVersion: '1' parents: #() authoredAt: '2020-01-01T0Z' committedAt: '2020-01-01T0Z');
		add: nil; "later"
		add: (self newVersion: '3' parents: {versions at: 1} authoredAt: '2020-01-03T0Z' committedAt: '2020-01-03T0Z');
		add: (self newVersion: '4' parents: {versions at: 1} authoredAt: '2020-01-04T0Z' committedAt: '2020-01-04T0Z');
		at: 2 put: (self newVersion: '2' parents: {versions at: 4. versions at: 3} authoredAt: '2019-12-01T0Z' committedAt: '2020-01-04T13:00Z');
		add: (self newVersion: '5' parents: {versions at: 2} authoredAt: '2020-01-05T0Z' committedAt: '2020-01-05T0Z');
		add: (self newVersion: '6' parents: {versions at: 3} authoredAt: '2020-01-06T0Z' committedAt: '2020-01-06T0Z').
	result :=(repository historianNamed: 'bottom') version: (versions at: 6);
		versionsNotOn: ((repository historianNamed: 'top') version: (versions at: 5); yourself).
	self assert: result asBag = {versions at: 6} asBag.