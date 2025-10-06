#!/bin/bash
# Analizador de tráfico de red y posibles amenazas

LOG_DIR="/var/log/traffic_analysis"
REPORT_FILE="$LOG_DIR/report_$(date +%Y%m%d).txt"

mkdir -p $LOG_DIR

analyze_connections() {
    echo "=== CONEXIONES ACTIVAS ===" > $REPORT_FILE
    netstat -tun | grep ESTABLISHED >> $REPORT_FILE
    
    echo "" >> $REPORT_FILE
    echo "=== CONEXIONES SOSPECHOSAS ===" >> $REPORT_FILE
    # Conexiones a puertos no comunes
    netstat -tun | grep -E ':(0|1|7|11|15|19|23|79)' >> $REPORT_FILE
}

analyze_firewall() {
    echo "" >> $REPORT_FILE
    echo "=== ESTADO FIREWALL ===" >> $REPORT_FILE
    sudo ufw status verbose >> $REPORT_FILE
}

analyze_dns() {
    echo "" >> $REPORT_FILE
    echo "=== CONSULTAS DNS RECIENTES ===" >> $REPORT_FILE
    sudo journalctl -u systemd-resolved --since "1 hour ago" | grep "query" >> $REPORT_FILE
}

# Ejecutar análisis
analyze_connections
analyze_firewall 
analyze_dns

echo "Análisis completado: $REPORT_FILE"
