#!/bin/csh

# Script for running GAMESS.

set JOB=$1
set NCPUS=$2
set VERNO=01

if (null$NCPUS == null) set NCPUS=1
if ($JOB:r.inp == $JOB) set JOB=$JOB:r # strip off possible .inp

# Run GAMESS:

set WRK=`pwd`
set SCR=~$USER/tmp

rungms $JOB $VERNO $NCPUS >& $JOB.log 

# Clean up:

if (-e $SCR/$JOB.efp)   cp -f $WRK
if (-e $SCR/$JOB.gamma) cp -f $WRK
if (-e $SCR/$JOB.trj)   cp -f $WRK
if (-e $SCR/$JOB.rst)   cp -f $WRK
if (-e $SCR/$JOB.dat)   cp -f $WRK
if (-e $SCR/$JOB.cosmo) cp -f $WRK
if (-e $SCR/$JOB.pot)   cp -f $WRK
if (-e $SCR/$JOB.ldos)  cp -f $WRK

rm -f $SCR/$JOB.*
