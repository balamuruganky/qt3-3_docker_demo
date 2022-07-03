FROM balagct/qt-3.3:latest
LABEL maintainer="BK"

RUN yum update -y && yum install xorg-x11-apps -y

ENV BUILD_PATH /usr/local/build/
COPY . ${BUILD_PATH}

RUN cd ${BUILD_PATH}/qt3.3_demo && qmake && make

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

WORKDIR /usr/local/build/qt3.3_demo
ENTRYPOINT ["/usr/local/build/qt3.3_demo/table"]
