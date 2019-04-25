#!/bin/sh
CVSROOT=/home/cvsroot; export CVSROOT
CVSROOT=:pserver:wrc@192.168.10.113:2401/home/cvsroot
cvs login
cvs import soft.xsaas.com V1_0_0 init
