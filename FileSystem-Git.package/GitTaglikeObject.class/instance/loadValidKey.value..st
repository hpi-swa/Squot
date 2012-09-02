loading
loadValidKey: key value: value
	| selector |
	selector := ('load', (key asIdentifier: true)) asSymbol asMutator.
	self perform: selector with: value