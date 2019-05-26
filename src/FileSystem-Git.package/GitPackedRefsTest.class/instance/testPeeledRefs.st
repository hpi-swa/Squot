testing
testPeeledRefs
	self assert: (packedRefs peeledRefs includes:
		(GitReference name: 'refs/tags/v2.8.5' target: '548d840e1200b94d3a8baab463e280bfbb79c013')).
	#('refs/heads/master' 'refs/remotes/origin/master')
		do: 	[:each |
			(packedRefs refsDictionary at: each) = (packedRefs peeledRefsDictionary at: each)].