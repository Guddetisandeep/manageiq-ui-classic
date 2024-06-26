/* eslint-disable max-len */
export const ansiblePlaybookData = ({
  id: 1000,
  payload: `
  ---
  - name: Provision instances
    hosts: localhost
    connection: local
    gather_facts: False
    # load AWS variables from this group vars file
    vars_files:
      - group_vars/all
    tasks:
      - name: Launch instances
        ec2:
        access_key: "{{ ec2_access_key }}"
        secret_key: "{{ ec2_secret_key }}"
        keypair: "{{ ec2_keypair }}"
        group: "{{ ec2_security_group }}"
        type: "{{ ec2_instance_type }}"
        image: "{{ ec2_image }}"
        region: "{{ ec2_region }}"
        instance_tags: "{'ansible_group':'jboss', 'type':'{{ ec2_instance_type }}', 'group':'{{ ec2_security_group }}', 'Name':'demo_''{{ tower_user_name }}'}"
        count: "{{ ec2_instance_count }}"
        wait: true
        register: ec2
      - name: Wait for SSH to come up
        wait_for:
        host: "{{ item.public_dns_name }}"
        port: 22
        delay: 60
        timeout: 320
        state: started
        with_items: "{{ ec2.instances }}"`,
  payloadType: 'yaml',
});
