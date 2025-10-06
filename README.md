Características
- Monitoreo de conexiones activas en tiempo real
- Detección de conexiones sospechosas* en puertos no comunes
- Análisis de firewall y reglas UFW
- Logs de consultas DNS recientes
- Generación de reportes automatizados en `/var/log/traffic_analysis/`

Tecnologías
- Bash Scripting
- Networking Tools: netstat, UFW, systemd-resolved
- Linux System Administration
- Log Analysis

Instalación
git clone https://github.com/tuusuario/network-traffic-analyzer.git
cd network-traffic-analyzer
chmod +x traffic_analyzer.sh

Ejecutar análisis completo
sudo ./traffic_analyzer.sh

Ver reporte generado
cat /var/log/traffic_analysis/report_YYYYMMDD.txt
