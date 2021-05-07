public-accessing
tags
	^ self currentUnitOfWork tags select: [ :tag | tag object = self ]