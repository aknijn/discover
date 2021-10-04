# DiSCoVer
The DiSCoVer pipeline is a Galaxy tool that performs typing analyses on collections of STEC sequences


INSTALLATION
------------
1) In the $GALAXY_ROOT/tools directory: git clone https://github.com/aknijn/discover.git

2) Launch the tool from the Galaxy interface to install the dependencies (Galaxy should use conda to install them).
   The dependencies should be installed as an environment in the directory mulled-v1-01518e709b4628df704fe28ad234df64efe35104c6318251731e2705afdd7d56

3) Install fastq-pair

    cd /$GALAXY_ROOT/tools/discover/scripts/fastq-pair-master
    mkdir build && cd build
    cmake ../
    cd ..
    make && sudo make install
	chmod u+x /$GALAXY_ROOT/tools/discover/scripts/fastq-pair-master/build/fastq_pair

4) Install duk

    cd /$GALAXY_ROOT/tools/discover/scripts/duk
    make
	chmod u+x /$GALAXY_ROOT/tools/discover/scripts/duk/duk

5) Correct trimmomatic

    cd /$GALAXY_ROOT/{tool_dependency_dir}/_conda/envs/mulled-v1-01518e709b4628df704fe28ad234df64efe35104c6318251731e2705afdd7d56/bin
    chmod 755 ../share/trimmomatic-0.39-2/trimmomatic.jar
    ln -s ../share/trimmomatic-0.39-2/trimmomatic.jar trimmomatic.jar

6) Move virulotyper database

    mv /$GALAXY_ROOT/tools/discover/virulotyper /$GALAXY_ROOT/{tool_dependency_dir}/_conda/envs/mulled-v1-01518e709b4628df704fe28ad234df64efe35104c6318251731e2705afdd7d56/db

6) Install chewBBACA database

    cd /$GALAXY_ROOT/tools/discover/data
    tar -xvzf schema_chewBBACA_cgMLST_V4.tar.gz






