accessing
committer

	^ committer ifNil: [committer := self workingCopy defaultAuthor]