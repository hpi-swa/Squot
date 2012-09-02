processing
computeCRC
	crc := CRC crc32FromCollection: (file contents copyFrom: headerPos + 1 to: headerPos + packedLength)