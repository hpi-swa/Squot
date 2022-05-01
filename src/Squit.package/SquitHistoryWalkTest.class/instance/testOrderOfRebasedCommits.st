tests
testOrderOfRebasedCommits
	"When several commits are rebased, they all have the same committer timestamp. This must not disrupt the order of the commits in the history walk, which should correspond to the ancestry order. It also must not prematurely stop the walk, which previously happened starting from four versions with the same committer timestamp, because the same versions were queued repeatedly."
	| versions commitList |
	"Given"
	(versions := OrderedCollection new)
		add: (self newVersion: '1' parents: #() authoredAt: '2020-01-01T0Z' committedAt: '2020-01-01T0Z');
		add: (self newVersion: '2' parents: {versions last} authoredAt: '2020-01-02T0Z' committedAt: '2020-01-02T0Z');
		add: (self newVersion: '3' parents: {versions last} authoredAt: '2020-01-03T0Z' committedAt: '2020-01-10T0Z');
		add: (self newVersion: '4' parents: {versions last} authoredAt: '2020-01-04T0Z' committedAt: '2020-01-10T0Z');
		add: (self newVersion: '5' parents: {versions last} authoredAt: '2020-01-05T0Z' committedAt: '2020-01-10T0Z');
		add: (self newVersion: '6' parents: {versions last} authoredAt: '2020-01-06T0Z' committedAt: '2020-01-10T0Z');
		add: (self newVersion: '7' parents: {versions last} authoredAt: '2020-01-17T0Z' committedAt: '2020-01-17T0Z').
	"When"
	commitList := repository historyWalkClass new nextPut: versions last; upToEnd.
	"Then"
	self assert: versions first equals: commitList last;
		assert: #('7' '6' '5' '4' '3' '2' '1') equals: (commitList collect: [:each | each message]) asArray.