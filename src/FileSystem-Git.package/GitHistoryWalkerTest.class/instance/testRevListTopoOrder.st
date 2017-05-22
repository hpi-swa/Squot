testing
testRevListTopoOrder
	| first a1 a2 b1 b2 base merge revList |
	first := DateAndTime year: 2017 day: 1.
	base := self addCommit: 'base' time: first withParents: {}.
	a1 := self addCommit: 'a1' time: first + 2 minutes withParents: {base}.
	b1 := self addCommit: 'b1' time: first + 3 minutes withParents: {base}.
	a2 := self addCommit: 'a2' time: first + 4 minutes withParents: {a1}.
	b2 := self addCommit: 'b2' time: first + 5 minutes withParents: {b1}.
	merge := self addCommit: 'merge' time: first + 10 minutes withParents: {a2. b2}.
	repository updateRef: repository headsDir / 'master' to: merge hexHash.
	GitFSCK validate: repository.
	"when"
	revList := historyWalker startingFrom: (repository branches at: 'master').
	"then"
	self assert: (revList asBag = {base. a1. a2. b1. b2. merge} asBag)
		description: 'correct bag of commits'.
	self assert: (revList indexOf: a2) + 1 = (revList indexOf: a1)
		description: 'a1 comes after a2'.
	self assert: (revList indexOf: b2) + 1 = (revList indexOf: b1)
		description: 'b1 comes after b2'.
	self assert: revList last = base.
	self assert: revList first = merge.