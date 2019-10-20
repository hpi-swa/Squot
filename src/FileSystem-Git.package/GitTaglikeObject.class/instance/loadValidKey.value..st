loading
loadValidKey: key value: value
	| selector |
	selector := ('load', (key asIdentifier: true)) asSymbol asSimpleSetter.
	self perform: selector with: value