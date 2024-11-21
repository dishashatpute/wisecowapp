#  Develop a Dockerfile for creating a container image of the Wisecow
#  application.


#  base image
FROM alpine:latest

# Install packages
RUN apk add --no-cache fortune cowsay netcat-openbsd

# Copy the script container
COPY wisecow.sh /usr/local/bin/Wisecow.sh

# Set the script as executable
RUN chmod +x /usr/local/bin/wisecow.sh

#  port defined in the script
EXPOSE 4499

# Command to run when the container starts
CMD ["/usr/local/bin/your_script.sh"]
