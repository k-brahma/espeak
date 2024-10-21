FROM alpine:latest

WORKDIR /app

# Update package list and upgrade OpenSSL
RUN apk update && \
    apk upgrade --no-cache openssl

# Install espeak 
RUN apk add --no-cache espeak

# Set default language to Latin
# CMD ["sh", "-c", "cp output.wav /mnt"]
CMD ["sh", "-c", "espeak -v la -w /mnt/caesar.wav \"$TEXT\""]
