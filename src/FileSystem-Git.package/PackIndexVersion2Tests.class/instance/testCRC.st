tests
testCRC
	"CRCs are only found in version 2 index files"
	self usePackWithOfsDelta.
	{ 
	'fea21a7e0e910cf24f3c455cc6e0ea86d589a0db' -> 12.
	'21f6939ef44d5fadc3f537300b42e4b2889cc415' -> 161.
	'77022a3c03d87ef1487d282ad8c8c57941469417' -> 310.
	'ea511757325072abacc21fc749c7000461dbc857' -> 429.
	'370101a2d57b40c37da9b42b688e61eb968f943e' -> 473.
	'98564e36d46a682f13e716b6f5e13d94cd9461b7' -> 705.
	'd8bf7c56584e5e2a7d51f27ea9eec36cc2695b72' -> 749.
	'e1f6defb3f5b3e6d851165c8c38c18ba42b5649b' -> 776.
	'286064b187da14ddaab211e6579a225f179083e7' -> 820 }
	do: [ :assoc | self verifyCRCFor: assoc key at: assoc value ]