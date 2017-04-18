as yet unclassified
contents
	^ self item children collect: [:each | SquotDiffNodeWrapper with: each model: self model]