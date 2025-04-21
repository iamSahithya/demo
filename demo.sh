#!/bin/bash
REGION="us-west-2"
THRESHOLD=70
PROFILE="default"  # optional

# ===== GET INSTANCE ID FROM TERRAFORM =====
INSTANCE_ID=$(terraform output -raw ec2_instance_id)

if [ -z "$INSTANCE_ID" ]; then
  echo " Could not retrieve instance ID from Terraform."
  exit 1
fi

echo "Monitoring EC2 Instance: $INSTANCE_ID"

# ===== CHECK INSTANCE STATE =====
STATE=$(aws ec2 describe-instances \
  --instance-ids "$INSTANCE_ID" \
  --region "$REGION" \
  --query "Reservations[].Instances[].State.Name" \
  --output text \
  --profile "$PROFILE")

echo "Instance state: $STATE"

if [ "$STATE" != "running" ]; then
  echo "Instance is not running. Exiting."
  exit 1
fi
