# go to the location where the file is present for copy 
scp -i /pem_key_pair_file_path_name  filename_want_to_copy  ec2_user@ec2_public_ip:destination_location_on_remote

sudo chmod 400 DevOps.pem
eg: scp -i "DevOps.pem" DevOps.pem  ubuntu@ec2-34-239-103-88.compute-1.amazonaws.com:/home/ubuntu/keys
