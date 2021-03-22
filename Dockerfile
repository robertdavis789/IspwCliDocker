
FROM opensuse/leap

LABEL author="Robert Davis <robert.davis@compuware.com>"
USER root

RUN zypper up -y &&\
	zypper -q --non-interactive install \
	bats \
	curl \
	figlet \
	findutils \
	git-core \
	make \
	mc \
	siege \
	wget \
	vim \
	unzip \
	expect \
	sudo \
	java-11-openjdk \
	wget

#Install Topaz CLI
RUN mkdir /TopazCliInstall	
RUN wget http://dtw-svngateway.prodti.compuware.com/CommonBundleDepot/products/Enterprise/TopazCLI/207-ci-repo/TopazCLI-linux.gtk.x86_64.zip
RUN mv TopazCLI-linux.gtk.x86_64.zip /TopazCliInstall/TopazCLI-linux.gtk.x86_64.zip
WORKDIR "/TopazCliInstall"
RUN unzip TopazCLI-linux.gtk.x86_64.zip
RUN chmod 777 IspwCLI.sh

#Set JAVA_HOME environment variable
RUN export JAVA_HOME=/usr/lib64/jvm/java-11-openjdk-11
