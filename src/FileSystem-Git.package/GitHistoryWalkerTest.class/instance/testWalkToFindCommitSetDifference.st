testing
testWalkToFindCommitSetDifference
	| commit1 commit2 commit3 commit4 commit5 commit6 revisions |
	"commit1 --- commit2 --- commit3 --- commit6
	               `--- commit4 --- commit5 --´"
	commit1 := self addCommit: '1' withParents: nil.
	commit2 := self addCommit: '2' withParents: {commit1 hexHash}.
	commit3 := self addCommit: '3' withParents: {commit2 hexHash}.
	commit4 := self addCommit: '4' withParents: {commit1 hexHash}.
	commit5 := self addCommit: '5' withParents: {commit4 hexHash}.
	commit6 := self addCommit: '6' withParents: {commit3 hexHash. commit5 hexHash}.
	repository unitOfWork updateRef: 'refs/heads/master' to: commit6 hexHash.
	GitFSCK validate: repository.
	"when"
	"rev-list commit2...commit6 ---> commit[3,4,5,6]"
	revisions := historyWalker
		excludeAncestorsOf: commit2;
		startingFromAll: {commit2. commit6}.
	"then"
	self assert: revisions asBag = {commit3. commit4. commit5. commit6} asBag.
	"TODO: assert something about the order"