as yet unclassified
testRevListWithMerge
	| commit1 commit2 commit3 commit4 |
	commit1 := self addCommit: '1' withParents: nil.
	commit2 := self addCommit: '2' withParents: {commit1 hexHash}.
	commit3 := self addCommit: '3' withParents: {commit1 hexHash}.
	commit4 := self addCommit: '4' withParents: {commit2 hexHash. commit3 hexHash}.
	repository updateRef: repository headsDir / 'master' to: commit4 hexHash.
	GitFSCK validate: repository.
	"when"
	visitor visit: (repository branches at: 'master').
	"then"
	self assert: (visitor revisions asBag = {commit1. commit2. commit3. commit4} asBag)