WARNING: These EASTASIA mapping tables are all considered
obsolete and are no longer being maintained in any way.
They are preserved here only for historical purposes.

Archived August 2001.

Below is some analysis by Asmus Freytag of specific problems raised by T.
Kubota in this document:
	http://www.debian.or.jp/~kubota/unicode-symbols.html

(If the link becomes unavailable, the document has been archived by the
Unicode Technical Committee as document number L2/01-192.)

The analysis as it pertains to EastAsianWidth file is primarily
contained in document L2/001-189. What follows are those characters where
the mapping is in question, even though T. Kubota reported them as EAW 
problems.
In addition to mapping issues, we need to decide the status of JIS X0212 and
JIS X0213 as input legacy encodings to the EAW assignments.

The following are available as Full Width characters in the FFxx range.
Therefore, the mappings of these characters are incorrect. This appears to
be a *mapping file issue* as far as these characters are concerned

FILE JIS0208.TXT------
0x2140  U+005C  Na  # REVERSE SOLIDUS
0x215D  U+2212  N  # MINUS SIGN
0x2171  U+00A2  Na  # CENT SIGN
0x2172  U+00A3  Na  # POUND SIGN
0x224C  U+00AC  Na  # NOT SIGN


FILE CHINSIMP.TXT------
0x815F  U+005C  Na  # REVERSE SOLIDUS
0x817C  U+2212  N  # MINUS SIGN
0x8191  U+00A2  Na  # CENT SIGN
0x8192  U+00A3  Na  # POUND SIGN
0x81CA  U+00AC  Na  # NOT SIGN


FILE JIS0212.TXT------
0x2243  U+00A6  Na  # BROKEN BAR
0x2234  U+00AF  Na  # MACRON
0x2237  U+007E  Na  # TILDE

(This section should have been in L2/001-189 since it's more
of an EAW issue, not a mapping issue).

The following characters show up only in X0212. The relevant
issue to decide is "To what extent are there widespread
JIS X0212 implementations? My understanding is that this
standard is not widely supported, and with X0213 coming it
will be even less supported. Therefore I tend to exclude
it from the set of legacy encodings under consideration.

The decision to make is whether this belongs in the class
of legacy encodings supported by EAW and also whether we
need to consider X0213 as well.

0x226D  U+00A9  N  # COPYRIGHT SIGN
0x2238  U+0384  N  # GREEK TONOS
0x2239  U+0385  N  # GREEK DIALYTIKA TONOS
...
0x2B77  U+017C  N  # LATIN SMALL LETTER Z WITH DOT ABOVE

The following are again questionable mappings:

The next one is almost correct, it should be Na (?), if it
is used to map a single byte character in an EA legacy encoding.
This mapping should be confirmed, if possible, and the EAW
adjusted accordingly. The vendor mappings are font dependent,
i.e. they treat 0x7E as TILDE except in (some) fonts.

FILE SHIFTJIS.TXT------
0x7E  U+203E  N  # OVERLINE

This may be a mapping table error.
Microsoft maps this location to Hyphenation point, which is "A".

FILE BIG5.TXT------
0xA145  U+2022  N  # BULLET

This may be a mapping table error.
The Microsoft mapping is to SMALL IDEOGRAPHIC COMMA which is "W"

0xA14E  U+FF64  H  # HALFWIDTH IDEOGRAPHIC COMMA

This may be a mapping table error.
The Microsoft mapping is to CIRCLED PLUS, which is "A"
0xA1F2  U+2641  N  # EARTH

Is this the same or is it different from Macron? Should it be mapped to FW
macron? Microsoft maps it to 00AF which means that one would need to be
"A" 0xA1C3 is mapped to FW Macron in the MS mappings.

0xA1C2  U+203E  N  # OVERLINE




