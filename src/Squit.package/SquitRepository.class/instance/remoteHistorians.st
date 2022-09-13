synchronizing
remoteHistorians
	^ Array streamContents: [:stream |
		self git
			allReferencesPrefixedWith: 'refs/remotes/'
			do: [:each | stream nextPut:
					(SquitHistorian
						existingNamed: (each allButFirst: 'refs/remotes/' size)
						repository: self
						git: gitRepository repository)]]