# Image de base avec OMNeT++
FROM ubuntu:20.04

# Éviter les prompts interactifs
ENV DEBIAN_FRONTEND=noninteractive

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
    build-essential gcc g++ make \
    python3 python3-pip git \
    openjdk-11-jdk \
    qt5-qmake qt5-default libqt5opengl5 \
    wget curl \
    && rm -rf /var/lib/apt/lists/*

# Créer le répertoire de travail
WORKDIR /opt/omnetpp-workspace

# Télécharger et compiler OMNeT++
RUN wget https://github.com/omnetpp/omnetpp/releases/download/omnetpp-5.7/omnetpp-5.7-src-linux.tgz && \
    tar xzf omnetpp-5.7-src-linux.tgz && \
    cd omnetpp-5.7 && \
    ./configure && \
    make -j$(nproc) && \
    rm ../omnetpp-5.7-src-linux.tgz

# Cloner et compiler INET Framework
RUN git clone https://github.com/inet-framework/inet.git inet && \
    cd inet && \
    git checkout v4.4.0 && \
    cd src && \
    opp_makemake -f --deep --make-so && \
    make -j$(nproc)

# Ajouter OMNeT++ et INET au PATH
ENV PATH=/opt/omnetpp-workspace/omnetpp-5.7/bin:$PATH
ENV INET_PROJECT=/opt/omnetpp-workspace/inet

# Cloner le projet
RUN git clone https://github.com/saadimane256-prog/wireless-network-simulation.git && \
    cd wireless-network-simulation && \
    chmod +x setup.sh && \
    ./setup.sh

# Installer les dépendances Python
RUN pip3 install matplotlib numpy pandas scipy

# Répertoire de travail final
WORKDIR /opt/omnetpp-workspace/wireless-network-simulation

# Commande par défaut
CMD ["/bin/bash"]
