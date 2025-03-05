# Use an official Ubuntu LTS base image
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages:
# – XFCE4 for the desktop environment (lightweight and compatible)
# – xrdp for RDP access
# – dbus-x11 (required by XFCE)
# – curl and wget for additional downloads
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y xfce4 xfce4-terminal xrdp dbus-x11 curl wget gnupg sudo && \
    rm -rf /var/lib/apt/lists/*

# Configure XRDP to use XFCE:
# Create a default X session file that starts XFCE4
RUN echo "startxfce4" > /etc/skel/.xsession

# Modify the XRDP startup script to ensure XFCE starts properly:
RUN sed -i.bak '/^new_cursors/d' /etc/xrdp/startwm.sh && \
    echo "xfce4-session" >> /etc/xrdp/startwm.sh

# Expose the default RDP port
EXPOSE 3389

# Install Tailscale
RUN curl -fsSL https://tailscale.com/install.sh | sh

# Copy the entrypoint script into the image
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
