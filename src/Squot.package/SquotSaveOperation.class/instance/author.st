accessing
author

	^ author ifNil: [author := self workingCopy defaultAuthor]