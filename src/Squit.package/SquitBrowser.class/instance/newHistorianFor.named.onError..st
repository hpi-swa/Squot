private
newHistorianFor: repository named: historianName onError: cancelBlock

	^ [repository historianNamed: historianName]
		on: GitInvalidReferenceName  
		do: [:e | self inform: e validationReport. ^ cancelBlock value].