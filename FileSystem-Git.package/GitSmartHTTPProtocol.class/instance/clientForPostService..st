private
clientForPostService: serviceName
 	^ self client
		url: self url asZnUrl / serviceName;
		yourself