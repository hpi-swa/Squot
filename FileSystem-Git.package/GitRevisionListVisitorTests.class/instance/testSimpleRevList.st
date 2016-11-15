as yet unclassified
testSimpleRevList
	| commit1 commit2 |
	commit1 := self addCommit: '1' withParents: nil.
	commit2 := self addCommit: '2' withParents: {commit1 hexHash}.
	repository updateRef: repository headsDir / 'master' to: commit2 hexHash.
	GitFSCK validate: repository.
	"when"
	visitor visit: (repository branches at: 'master').
	"then"
	self assert: (visitor revisions includesAllOf: {commit1. commit2})