actions
actionAddPackage
	self workingCopy mappers add:
		(SquotTonelMapper package:
			(MCPackage named: self selectedPackageName)).
	self mappersChanged.