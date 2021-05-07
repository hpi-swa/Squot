testing
testSimpleRevList
	| commit1 commit2 revList |
	commit1 := self addCommit: '1' withParents: nil.
	commit2 := self addCommit: '2' withParents: {commit1 hexHash}.
	repository unitOfWork updateRef: 'refs/heads/master' to: commit2 hexHash.
	GitFSCK validate: repository.
	"when"
	revList := historyWalker startingFrom: (repository unitOfWork branches at: 'master').
	"then"
	self assert: (revList includesAllOf: {commit1. commit2})