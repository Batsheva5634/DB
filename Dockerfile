FROM mcr.microsoft.com/mssql/server:2019-latest

# Set environment variables
ENV SA_PASSWORD=stagecraftsql@123SQL
ENV ACCEPT_EULA=Y

# Expose SQL Server port
EXPOSE 1433

# Run as root to avoid permission issues
USER root

# Create required directories
RUN mkdir -p /var/opt/mssql/data /var/opt/mssql/log /var/opt/mssql/secrets /var/opt/mssql/backup

# Change ownership and permissions
RUN chown -R root:root /var/opt/mssql /var/opt/mssql/data /var/opt/mssql/log /var/opt/mssql/secrets /var/opt/mssql/backup
RUN chmod -R 755 /var/opt/mssql /var/opt/mssql/data /var/opt/mssql/log /var/opt/mssql/secrets /var/opt/mssql/backup

# Debugging permissions
RUN ls -la /var/opt/mssql
RUN ls -la /var/opt/mssql/data
RUN ls -la /var/opt/mssql/log
RUN ls -la /var/opt/mssql/secrets
RUN ls -la /var/opt/mssql/backup

# Start SQL Server as root
CMD ["/opt/mssql/bin/sqlservr"]
