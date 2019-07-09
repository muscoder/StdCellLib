#!/usr/bin/perl -w
use strict;

print <<EOF
# LEF file generated by lefgen from LibreSilicon version 0.1
#

VERSION 5.4 ;
NAMESCASESENSITIVE ON ;
BUSBITCHARS "[]" ;
DIVIDERCHAR "/" ;
UNITS
  DATABASE MICRONS 1000 ;
END UNITS

USEMINSPACING OBS ON ;
USEMINSPACING PIN OFF ;
CLEARANCEMEASURE EUCLIDEAN ;


MANUFACTURINGGRID 0.15 ;

LAYER nwell
  TYPE	MASTERSLICE ;
END nwell

LAYER nactive
  TYPE	MASTERSLICE ;
END nactive

LAYER pactive
  TYPE	MASTERSLICE ;
END pactive

LAYER poly
  TYPE	MASTERSLICE ;
END poly

LAYER cc
  TYPE	CUT ;
  SPACING	0.9 ;
END cc

LAYER metal1
  TYPE		ROUTING ;
  DIRECTION	HORIZONTAL ;
  PITCH		3  ;
  OFFSET	1.5 ;
  WIDTH		0.9 ;
  SPACING	0.9 ;
  RESISTANCE	RPERSQ 0.09 ;
  CAPACITANCE	CPERSQDIST 3.2e-05 ;
END metal1

LAYER via
  TYPE	CUT ;
  SPACING	0.9 ;
END via

LAYER metal2
  TYPE		ROUTING ;
  DIRECTION	VERTICAL ;
  PITCH		2.4  ;
  OFFSET	1.2 ;
  WIDTH		0.9 ;
  SPACING	0.9 ;
  RESISTANCE	RPERSQ 0.09 ;
  CAPACITANCE	CPERSQDIST 1.6e-05 ;
END metal2

LAYER via2
  TYPE	CUT ;
  SPACING	0.9 ;
END via2

LAYER metal3
  TYPE		ROUTING ;
  DIRECTION	HORIZONTAL ;
  PITCH		3  ;
  OFFSET	1.5 ;
  WIDTH		1.5 ;
  SPACING	0.9 ;
  RESISTANCE	RPERSQ 0.05 ;
  CAPACITANCE	CPERSQDIST 1e-05 ;
END metal3

SPACING
  SAMENET cc  via	0.150 ;
  SAMENET via  via2	0.150 ;
END SPACING

VIA M2_M1 DEFAULT
  LAYER metal1 ;
    RECT -0.600 -0.600 0.600 0.600 ;
  LAYER via ;
    RECT -0.300 -0.300 0.300 0.300 ;
  LAYER metal2 ;
    RECT -0.600 -0.600 0.600 0.600 ;
END M2_M1

VIA M3_M2 DEFAULT
  LAYER metal2 ;
    RECT -0.600 -0.600 0.600 0.600 ;
  LAYER via2 ;
    RECT -0.300 -0.300 0.300 0.300 ;
  LAYER metal3 ;
    RECT -0.900 -0.900 0.900 0.900 ;
END M3_M2


VIARULE viagen21 GENERATE
  LAYER metal1 ;
    DIRECTION HORIZONTAL ;
    WIDTH 1.2 TO 120 ;
    OVERHANG 0.3 ;
    METALOVERHANG 0 ;
  LAYER metal2 ;
    DIRECTION VERTICAL ;
    WIDTH 1.2 TO 120 ;
    OVERHANG 0.3 ;
    METALOVERHANG 0 ;
  LAYER via ;
    RECT -0.3 -0.3 0.3 0.3 ;
    SPACING 1.5 BY 1.5 ;
END viagen21

VIARULE viagen32 GENERATE
  LAYER metal3 ;
    DIRECTION HORIZONTAL ;
    WIDTH 1.8 TO 180 ;
    OVERHANG 0.6 ;
    METALOVERHANG 0 ;
  LAYER metal2 ;
    DIRECTION VERTICAL ;
    WIDTH 1.2 TO 120 ;
    OVERHANG 0.6 ;
    METALOVERHANG 0 ;
  LAYER via2 ;
    RECT -0.3 -0.3 0.3 0.3 ;
    SPACING 2.1 BY 2.1 ;
END viagen32

VIARULE TURN1 GENERATE
  LAYER metal1 ;
    DIRECTION HORIZONTAL ;
  LAYER metal1 ;
    DIRECTION VERTICAL ;
END TURN1

VIARULE TURN2 GENERATE
  LAYER metal2 ;
    DIRECTION HORIZONTAL ;
  LAYER metal2 ;
    DIRECTION VERTICAL ;
END TURN2

VIARULE TURN3 GENERATE
  LAYER metal3 ;
    DIRECTION HORIZONTAL ;
  LAYER metal3 ;
    DIRECTION VERTICAL ;
END TURN3

SITE  corner
    CLASS	PAD ;
    SYMMETRY	R90 Y ;
    SIZE	300.000 BY 300.000 ;
END  corner

SITE  IO
    CLASS	PAD ;
    SYMMETRY	Y ;
    SIZE	90.000 BY 300.000 ;
END  IO

SITE  core
    CLASS	CORE ;
    SYMMETRY	Y ;
    SIZE	2.400 BY 30.000 ;
END  core

EOF
;

foreach(@ARGV)
{
  open IN,"<$_";
  while(<IN>)
  {
    print $_;
  }
  close IN;
  print "\n";
}


print "\nEND LIBRARY\n";
