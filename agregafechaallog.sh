#!/bin/bash
#
#script adddatetologperday.sh
# Version : 1.0
#Para inserta en tiempo real hora y fecha en archivo log que se gnera de forma continua
#Autor : Ing. Jorge Navarrete
#mail : jorge_n@web.de
#Fecha : 2016-02-16

#script adddatetologperday.sh
#Para inserta en tiempo real hora y fecha en archivo log que se gnera de forma continua

#user.log   nombre del log sin fecha
#15s  tiempo luego del cual el termina el comando siguiente
#ARCHIVO nombre que tendran los nuevos logs por dÃa
#DIRECTORIO directorio donde se va a leer el archivo de log orignal y donde se va a crear los logs por dia y con fecha y hora

#===========================================================================
PATH=/bin:/usr/bin:/usr/sbin/
#===========================================================================

FECHAHOY=`date +%Y-%m-%d`
CADENAFECHAHOY="`echo $FECHAHOY | sed 's/:/ /g'`"
ARCHIVO="user-"`echo $CADENAFECHAHOY`".log"
DIRECTORIO="/home/bit4id/logs/PCHQUITO1SSFE01"

cd $DIRECTORIO
timeout 15s tail -f user.log | awk '{now=strftime("%F %T%z\t");sub(/^/, now);print}' > $ARCHIVO

