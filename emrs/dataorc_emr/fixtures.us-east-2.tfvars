region = "us-east-2"

availability_zones = ["us-east-2a"]

namespace = "eg"

stage = "test"

name = "emr-test"

ebs_root_volume_size = 20

visible_to_all_users = true

release_label = "emr-5.27.0"

applications = ["Hive", "Hadoop", "Spark"]

core_instance_group_instance_type = "m4.2xlarge"

core_instance_group_instance_count = 1

core_instance_group_ebs_size = 30

core_instance_group_ebs_type = "gp2"

core_instance_group_ebs_volumes_per_instance = 1

master_instance_group_instance_type = "m4.2xlarge"

master_instance_group_instance_count = 1

master_instance_group_ebs_size = 20

master_instance_group_ebs_type = "gp2"

master_instance_group_ebs_volumes_per_instance = 1

create_task_instance_group = false

ssh_public_key_path = "/secrets"

generate_ssh_key = true
