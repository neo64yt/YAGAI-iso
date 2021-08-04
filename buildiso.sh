#!/bin/sh
# Automation script for building YAGAI-iso

# Settings
work_dir="./work"
out_dir="./out"
iso_profile="./archiso"

# Greet
greet_message() {
	cat << EOF
#################################################################
#			YAGAI-iso Builder			#
#			August Release				#
#			Written by Neo64YT			#
#	Git Repo: https://github.com/neo64yt/YAGAI-iso		#
#################################################################

Please make sure that you have all required dependencies.
EOF
}

# Creating necessary directories
create_dir() {
	printf "Creating the working directory ($work_dir)...\n"
	mkdir -p $work_dir
	printf "Creating the directory where the built ISO image will be placed ($out_dir)...\n"
	mkdir -p $out_dir
}

# Wait for 5 seconds
get_ready() {
	printf "Please wait for 5 seconds...\n"
	sleep 5s
}

# Building the ISO image
build_iso() {
	printf "Starting to build the ISO image...\n"
	sudo mkarchiso -v -w $work_dir -o $out_dir $iso_profile
}

# If the build is successful
build_success() {
	printf "Cleaning up...\n"
	sudo rm -rf $work_dir
	printf "Done! You can find the built ISO image in $out_dir. :D"
	exit 0
}

# If the build failed
build_failed() {
	printf "Oops! Something wrong happened. Sorry for your inconvenience. :("
	exit 1
}

greet_message
create_dir
get_ready
build_iso && build_success || build_failed



# vim: ft=sh
