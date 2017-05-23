testing
testRevListChronologicalOrder
	| first a1 a2 b1 b2 b3 base merge revList |
	first := DateAndTime year: 2017 day: 1.
	base := self addCommit: 'base' time: first withParents: {}.
	a1 := self addCommit: 'a1' time: first + 2 minutes withParents: {base}.
	b1 := self addCommit: 'b1' time: first + 3 minutes withParents: {base}.
	a2 := self addCommit: 'a2' time: first + 4 minutes withParents: {a1}.
	b2 := self addCommit: 'b2' time: first + 5 minutes withParents: {b1}.
	b3 := self addCommit: 'b3' time: first + 6 minutes withParents: {b2}.
	merge := self addCommit: 'merge' time: first + 10 minutes withParents: {a2. b3}.
	repository updateRef: repository headsDir / 'master' to: merge hexHash.
	GitFSCK validate: repository.
	"when"
	revList := historyWalker startingFrom: (repository branches at: 'master').
	"then"
	self assert: (revList asBag = {base. a1. a2. b1. b2. b3. merge} asBag)
		description: 'correct bag of commits'.
	self assert: (revList asArray = {merge. b3. b2. a2. b1. a1. base}).