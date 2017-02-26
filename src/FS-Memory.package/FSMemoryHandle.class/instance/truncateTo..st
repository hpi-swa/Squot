public
truncateTo: anInteger
	| path |
	path := reference filesystem resolve: reference path.
	bytes := reference filesystem store replaceFile: path in: [ :all  | all first: anInteger ].
	size := anInteger