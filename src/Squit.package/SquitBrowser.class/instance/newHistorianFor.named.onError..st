private
newHistorianFor: repository named: historianName onError: cancelBlock

	^ [repository historianNamed: historianName]
		on: GitInvalidReferenceName  
		do: [:e | UIManager default inform: e validationReport. cancelBlock value].