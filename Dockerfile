FROM ubuntu:latest
WORKDIR /app
COPY . .
RUN chmod +x *.sh || true
CMD ["bash"]
