comparing
= other
	^ other class = self class and: [
		other entryHash = self entryHash ]