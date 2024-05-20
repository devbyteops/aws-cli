FROM alpine:3.19.1
RUN apk add --no-cache python3 py3-pip aws-cli bash \
    && rm -rf /var/cache/apk/*

# Create the app user & Configure working directory
ARG USER_NAME=appuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN addgroup --gid $USER_GID $USER_NAME \
    && adduser -D -S -G $USER_NAME -u $USER_UID $USER_NAME \
    && mkdir /home/$USER_NAME/app && chown -R $USER_UID:$USER_GID /home/$USER_NAME/app && chmod -R 755 /home/$USER_NAME/app
WORKDIR /home/$USER_NAME/app
USER $USER_NAME