FROM goodwithtech/dockle:v0.4.10
COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]