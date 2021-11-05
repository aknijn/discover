# DiSCoVer
The DiSCoVer pipeline is a Galaxy tool that performs typing analyses on collections of STEC sequences


INSTALLATION
------------
In the $GALAXY_ROOT/tools directory: git clone https://github.com/aknijn/discover.git

Activate Galaxy to use conda

Add the following line to your /$GALAXY_ROOT/config/galaxy.yml file

    conda_auto_install: true

Add the following lines to your /$GALAXY_ROOT/config/dependency_resolvers_conf.xml file

    <galaxy_packages />
    <conda />
    <galaxy_packages versionless="true" />
    <conda versionless="true" />

Restart Galaxy and launch the tool from the Galaxy interface to install the dependencies (Galaxy should use conda to install them).
The dependencies should be installed as an environment in the directory mulled-v1-01518e709b4628df704fe28ad234df64efe35104c6318251731e2705afdd7d56
The first time the pipeline will fail but now the finalising steps can be performed.

Install fastq-pair

    cd /$GALAXY_ROOT/tools/discover/scripts/fastq-pair-master
    mkdir build && cd build
    cmake ../
    cd ..
    make && sudo make install
	chmod u+x /$GALAXY_ROOT/tools/discover/scripts/fastq-pair-master/build/fastq_pair

Install duk

    cd /$GALAXY_ROOT/tools/discover/scripts/duk
    make
	chmod u+x /$GALAXY_ROOT/tools/discover/scripts/duk/duk

Correct trimmomatic

    cd /$GALAXY_ROOT/{tool_dependency_dir}/_conda/envs/mulled-v1-01518e709b4628df704fe28ad234df64efe35104c6318251731e2705afdd7d56/bin
    chmod 755 ../share/trimmomatic-0.39-2/trimmomatic.jar
    ln -s ../share/trimmomatic-0.39-2/trimmomatic.jar trimmomatic.jar

Install the virulotyper database

    mv /$GALAXY_ROOT/tools/discover/virulotyper /$GALAXY_ROOT/{tool_dependency_dir}/_conda/envs/mulled-v1-01518e709b4628df704fe28ad234df64efe35104c6318251731e2705afdd7d56/db

Install the chewBBACA database

    cd /$GALAXY_ROOT/tools/discover/data
    tar -xvzf schema_chewBBACA_cgMLST_V4.tar.gz

Add the following line to your /$GALAXY_ROOT/config/tool_conf.xml file

    <tool file="discover/discover.xml" />




