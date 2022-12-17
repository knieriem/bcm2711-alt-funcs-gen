BEGIN {
	FS="\t"
	OFS=", "
	q="\""
}

NR==1 { next }

{
	# for each 5th line, append the GPIO number
	suffix=""
	if ((NR-2) % 5 == 0) {
		suffix = " // " NR-2
	}

	# do substitutions for all ALT fields
	for (i=3; i<10; i++) {
		# delete 
		sub("<reserved>", "", $i)
		sub("<Internal>", "", $i)

		# delete special functions that are also omitted from
		# the existing bcm283x mapping
		sub("^SOE_.*", "", $i)
		sub("^ARM_.*", "", $i)
		sub("^BSCSL.*", "", $i)
		sub("^SWE_.*", "", $i)
		sub("^SD.*", "", $i)
		sub("^SA[0-9].*", "", $i)

		# delete display related functions
		sub("^PCLK$", "", $i)
		sub("^DPI_.*", "", $i)
		sub("^DE$", "", $i)
		sub("^LCD.*", "", $i)

		# delete other special functions
		sub("^II_.*", "", $i)
		sub("^MII_.*", "", $i)
		sub("^RGMII.*", "", $i)
	}

	# print the Go source line
	print "\t{" q $3 q, q $4 q, q $5 q, q $6 q, q $7 q, q $8 q "}," suffix
}
