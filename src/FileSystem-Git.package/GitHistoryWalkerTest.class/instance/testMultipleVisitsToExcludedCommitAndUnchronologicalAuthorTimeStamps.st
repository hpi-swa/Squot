testing
testMultipleVisitsToExcludedCommitAndUnchronologicalAuthorTimeStamps
	| oldest a b c d e list rebaseTime |
	"given a long way from excluded version d to common ancestor a
	and a short way from start version e to a,
	and the versions from d to b are older than the ancestor a (rebased)"
	oldest := DateAndTime year: 2017 day: 1.
	rebaseTime := oldest + 5 minutes.
	a := self addCommit: 'A' time: rebaseTime - 1 minute withParents: #().
	b := self addCommit: 'B' time: oldest committedAt: rebaseTime withParents: {a}.
	c := self addCommit: 'C' time: oldest + 1 minute committedAt: rebaseTime withParents: {b}.
	d := self addCommit: 'D' time: oldest + 2 minutes committedAt: rebaseTime withParents: {c}.
	e := self addCommit: 'E' time: rebaseTime + 1 minute withParents: {a}.
	"when"
	historyWalker excludeAncestorsOf: d.
	list := Array streamContents: [:stream |
		historyWalker startingFrom: e do: [:each | stream nextPut: each]].
	"then"
	self assert: (list = {e}).