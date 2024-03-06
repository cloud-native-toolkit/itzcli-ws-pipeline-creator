# Start out with a small base image that supports Python
FROM registry.access.redhat.com/ubi9/python-311

# This is the default repository for the Pipeline base cookiecutter project but 
# is defined as a environment variable here to that it can be overridden.
ENV ITZ_PIPELINE_CC_PROJ "https://github.com/cloud-native-toolkit/cookiecutter-cdk8s-pipeline.git"
RUN whoami

# Installing the things we need for the cdk8s (nodejs and yarn) project.
USER root
RUN dnf install -y nodejs && dnf clean all
RUN npm install yarn -g

USER default
# Installing cookiecutter
RUN pip install cookiecutter

COPY /scripts/entrypoint.sh /app/entrypoint.sh
WORKDIR /workspace

ENTRYPOINT [ "bash", "/app/entrypoint.sh" ]
