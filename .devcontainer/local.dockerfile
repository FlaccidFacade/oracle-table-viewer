# Use the OpenSUSE Leap image as the base image
# Regular Release: Leap follows a regular release model. It provides major releases at fixed intervals (approximately once a year), with a focus on stability and reliability.
# Long-Term Support (LTS): Leap versions are considered LTS releases, which means they receive support for an extended period (usually 3 years). This is particularly useful for users and organizations looking for a stable and well-maintained platform.
# Enterprise-Ready: Leap aims to be an enterprise-ready distribution with a strong focus on stability. It often shares code and packages with SUSE Linux Enterprise, which makes it a suitable choice for enterprise environments.
# Best For: Users and organizations that prioritize system stability and long-term support, such as servers, workstations, and production environments.
FROM opensuse/leap

# Refresh the package index
RUN sudo zypper refresh

# Install Java
RUN sudo zypper install java-11-openjdk
# Set the JAVA_HOME environment variable
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk
# Update the PATH environment variable to include the Java bin directory
ENV PATH $PATH:$JAVA_HOME/bin

# Install and Start Tomcat Server
RUN sudo zypper install tomcat10
# This will use java_home as default runtime
RUN sudo systemctl start tomcat10
RUN sudo systemctl enable tomcat10


# confirmation versions
RUN echo "Java version: $(java --version)"
RUN echo "tomcat version: $(tomcat10 --version)"
RUN echo "openssl version: $(openssl --version)"
RUN echo "opensuse version: $(cat /etc/os-release)"

