private
growTo: anInteger
	| path |
	path := reference filesystem resolve: reference path.
	bytes := reference filesystem store growFile: path to: bytes size + anInteger + self sizeIncrement