ARG ROOT_CONTAINER=muhhassani/pyiron-atomistic-image:latest
ARG BASE_CONTAINER=$ROOT_CONTAINER
FROM $BASE_CONTAINER

MAINTAINER Jan Janssen <janssen@mpie.de>, Muhammad Hassani <hassani@mpie.de>

USER $PYIRON_UID
WORKDIR $HOME
ARG PYTHON_VERSION=default

COPY . ${HOME}/
#RUN conda install --quiet -y -c conda-forge lammps &&\
RUN conda env update -n base -f ${HOME}/environment.yml --prune && \
    conda clean --all -f -y && \
    npm cache clean --force

USER root
RUN fix-permissions /home/$PYIRON_USER &&\
    fix-permissions $CONDA_DIR && \
    chmod +x ${HOME}/include_notebooks.sh && \
    /bin/bash include_notebooks.sh &&\
    fix-permissions /home/$PYIRON_USER && \
    chown -R ${PYIRON_USER}:${NB_GID} ${HOME}/notebooks

# Fix permissions on /etc/jupyter as root
RUN fix-permissions /etc/jupyter/

# Switch back to pyiron to avoid accidental container runs as root
USER $PYIRON_UID

WORKDIR $HOME
