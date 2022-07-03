# Pull base image from docker registory
FROM balagct/qt-3.3:latest
LABEL maintainer="BK"

# Install X11 applications
RUN yum update -y && yum install xorg-x11-apps -y

# Copy the qt3,3 application in the docker image
ENV BUILD_PATH /usr/local/build/
COPY . ${BUILD_PATH}

# Compile the qt3.3 application
RUN cd ${BUILD_PATH}/qt3.3_demo && qmake && make

# Argments to create user and set uid / gid.
ARG user
ARG uid
ARG gid

#Add new user with our credentials
ENV USERNAME ${user}
RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod  --uid ${uid} $USERNAME && \
        groupmod --gid ${gid} $USERNAME

# Execute the compiled qt3.3 application
WORKDIR /usr/local/build/qt3.3_demo
ENTRYPOINT ["/usr/local/build/qt3.3_demo/table"]
