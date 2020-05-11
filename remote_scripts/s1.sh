#!/bin/sh
###########################
echo [EXECUTING COMMAND INITIATED BY MASTER]

cache_dir="/home/ubuntu/cache"
base_node="192.168.0.10"
sudo rm -rf /home/ubuntu/input_data
sudo rm -rf /home/ubuntu/cache
sudo rm -rf /tmp/*


#scp -i /home/ubuntu/cwl.pem -r ubuntu@$base_node:/home/ubuntu/cache /home/ubuntu/
scp -i /home/ubuntu/cwl.pem -r ubuntu@$base_node:/home/ubuntu/database/input_data /home/ubuntu/

input_dir="/home/ubuntu/input_data"
cwllib_dir="/var/lib/cwl"
#cwllib_dir="/tmp"

mkdir -p "$cache_dir/s1_volume1"
mkdir -p "$cache_dir/s2_volume1"
mkdir -p "$cache_dir/s3_volume1"
mkdir -p "$cache_dir/s4_volume1"

doc_image1="quay.io/biocontainers/megahit:1.1.1--py35_0"
doc_image2="virusx/pigz:2.3.4"
doc_image3="virusx/bbmap:36.84--0"
doc_image4="virusx/bbmap:36.84--0"

s1locvol1="$cache_dir/s1_volume1"
s1docvol1="/var/spool/cwl"

s1locvol2="/tmp/tmpNSd4U8"
s1docvol2="/tmp"

s1locvol3="$input_dir/sample1_R1.trimmed.fastq.gz"
s1docvol3="$cwllib_dir/s1docker_dir3/sample1_R1.trimmed.fastq.gz"

s1locvol4="$input_dir/sample2_R1.trimmed.fastq.gz"
s1docvol4="$cwllib_dir/s1docker_dir4/sample2_R1.trimmed.fastq.gz"

s1locvol5="$input_dir/sample1_unpaired.trimmed.fastq.gz"
s1docvol5="$cwllib_dir/s1docker_dir1/sample1_unpaired.trimmed.fastq.gz"

s1locvol6="$input_dir/sample1_R2.trimmed.fastq.gz"
s1docvol6="$cwllib_dir/s1docker_dir2/sample1_R2.trimmed.fastq.gz"

s1locvol7="$input_dir/sample2_unpaired.trimmed.fastq.gz"
s1docvol7="$cwllib_dir/stg69b58e98-4918-4adf-950a-159368109a71/sample2_unpaired.trimmed.fastq.gz"

s1locvol8="$input_dir/sample2_R2.trimmed.fastq.gz"
s1docvol8="$cwllib_dir/stg407901cb-c397-44b0-88a3-ba0c00c47e72/sample2_R2.trimmed.fastq.gz"

s2locvol1="$cache_dir/s2_volume1"
s2docvol1="/var/spool/cwl"

s2locvol2="/tmp/tmpIjHiii"
s2docvol2="/tmp"

s2locvol3="$cache_dir/s1_volume1/megahit_out/megahit.log"
s2docvol3="$cwllib_dir/stge258482e-6be1-4a52-bf63-815c1396e154/megahit.log"



s3locvol1="$cache_dir/s3_volume1"
s3docvol1="/var/spool/cwl"
s3locvol2="/tmp/tmppf11Ly"
s3docvol2="/tmp"
s3locvol3="$input_dir/sample1_R1.trimmed.fastq.gz"
s3docvol3="$cwllib_dir/stgfcef4585-a6c8-4532-9f39-bd85cd333885/sample1_R1.trimmed.fastq.gz"
s3locvol4="$cache_dir/s1_volume1/megahit_out/megahit.contigs.fa"
s3docvol4="$cwllib_dir/stg7551d486-4312-4fd9-9e06-39be0ce09a4e/megahit.contigs.fa"
s3locvol5="$input_dir/sample1_R2.trimmed.fastq.gz"
s3docvol5="$cwllib_dir/stg2245a153-27bd-4272-a52b-89c49b0fa3f4/sample1_R2.trimmed.fastq.gz"

s4locvol1="$cache_dir/s4_volume1"
s4docvol1="/var/spool/cwl"

s4locvol2="/tmp/tmpso272p"
s4docvol2="/tmp"

s4locvol3="$cache_dir/s1_volume1/megahit_out/megahit.contigs.fa"
s4docvol3="$cwllib_dir/stg58f31473-f5cd-40b2-92b7-d5b59002341d/megahit.contigs.fa"

s4locvol4="$input_dir/sample2_R1.trimmed.fastq.gz"
s4docvol4="$cwllib_dir/stg0bbac8bf-3478-4e93-91f2-189f2bd49114/sample2_R1.trimmed.fastq.gz"

s4locvol5="$input_dir/sample2_R2.trimmed.fastq.gz"
s4docvol5="$cwllib_dir/stgf4f7800d-0f76-41ef-89de-bdd9e6033458/sample2_R2.trimmed.fastq.gz"


s1v1="$s1locvol1:$s1docvol1:rw" 
s1v2="$s1locvol2:$s1docvol2:rw"
s1v3="$s1locvol3:$s1docvol3:ro"
s1v4="$s1locvol4:$s1docvol4:ro"
s1v5="$s1locvol5:$s1docvol5:ro"
s1v6="$s1locvol6:$s1docvol6:ro"
s1v7="$s1locvol7:$s1docvol7:ro"
s1v8="$s1locvol8:$s1docvol8:ro"
s1gz1="$cwllib_dir/s1docker_dir1/sample1_unpaired.trimmed.fastq.gz"
s1gz2="$cwllib_dir/stg69b58e98-4918-4adf-950a-159368109a71/sample2_unpaired.trimmed.fastq.gz" 
s1gz3="$cwllib_dir/s1docker_dir3/sample1_R1.trimmed.fastq.gz"
s1gz4="$cwllib_dir/s1docker_dir4/sample2_R1.trimmed.fastq.gz" 
s1gz5="$cwllib_dir/s1docker_dir2/sample1_R2.trimmed.fastq.gz"
s1gz6="$cwllib_dir/stg407901cb-c397-44b0-88a3-ba0c00c47e72/sample2_R2.trimmed.fastq.gz"
s1w1="/var/spool/cwl"
###########################
s2v1="$s2locvol1:$s2docvol1:rw" 
s2v2="$s2locvol2:$s2docvol2:rw"
s2v3="$s2locvol3:$s2docvol3:ro"
s2w1="/var/spool/cwl" 
$s2l1
###########################
s3v1="$s3locvol1:$s3docvol1:rw"
s3v2="$s3locvol2:$s3docvol2:rw"
s3v3="$s3locvol3:$s3docvol3:ro"
s3v4="$s3locvol4:$s3docvol4:ro"
s3v5="$s3locvol5:$s3docvol5:ro" 
s3w1="/var/spool/cwl"
s3gz1="$cwllib_dir/stgfcef4585-a6c8-4532-9f39-bd85cd333885/sample1_R1.trimmed.fastq.gz"
s3gz2="$cwllib_dir/stg2245a153-27bd-4272-a52b-89c49b0fa3f4/sample1_R2.trimmed.fastq.gz"
s3fa1="$cwllib_dir/stg7551d486-4312-4fd9-9e06-39be0ce09a4e/megahit.contigs.fa"
############################
s4v1="$s4locvol1:$s4docvol1:rw"
s4v2="$s4locvol2:$s4docvol2:rw"
s4v3="$s4locvol3:$s4docvol3:ro" 
s4v4="$s4locvol4:$s4docvol4:ro"
s4v5="$s4locvol5:$s4docvol5:ro" 
s4w1="/var/spool/cwl"
s4gz1="$cwllib_dir/stg0bbac8bf-3478-4e93-91f2-189f2bd49114/sample2_R1.trimmed.fastq.gz"
s4gz2="$cwllib_dir/stgf4f7800d-0f76-41ef-89de-bdd9e6033458/sample2_R2.trimmed.fastq.gz"
s4fa1="$cwllib_dir/stg58f31473-f5cd-40b2-92b7-d5b59002341d/megahit.contigs.fa"
############################

docker run -i \
 --volume=$s1v1 \
 --volume=$s1v2 \
 --volume=$s1v3 \
 --volume=$s1v4 \
 --volume=$s1v5 \
 --volume=$s1v6 \
 --volume=$s1v7 \
 --volume=$s1v8 \
 --workdir=$s1w1 \
 --read-only=true \
 --user=1000:1000 \
 --rm \
 --env=TMPDIR=/tmp \
 --env=HOME=/var/spool/cwl \
 $doc_image1 \
 megahit \
 -t \
 4 \
 --out-prefix \
 megahit \
 -1 \
 $s1gz3,$s1gz4 \
 -2 \
 $s1gz5,$s1gz6 \
 --presets \
 meta-sensitive -r \
 $s1gz1,$s1gz2 

echo "UPLOADING OUTPUT TO BASE SYSTEM [ $base_node ]"
scp -i /home/ubuntu/cwl.pem -r /home/ubuntu/cache ubuntu@$base_node:/home/ubuntu/

if [ $? -eq 0 ]; then
	echo
	echo "SUCCESS"
	echo
else
	echo
	echo "FAIL"
	echo
	exit 1
fi
