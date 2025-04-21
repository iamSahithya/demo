#!/bin/bash
REGION="us-west-2"
THRESHOLD=70
PROFILE="default"  # optional

SNS_TOPIC_ARN=$(terraform output -raw sns_topic_arn)
aws sns subscribe \
  --topic-arn arn:aws:sns:us-west-2:257394482323:ec2-monitor-alerts \
  --protocol email \
  --notification-endpoint sahithya3098@gmail.com


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

send_alert() {
  local message="$1"
  aws sns publish \
    --topic-arn "$SNS_TOPIC_ARN" \
    --message "$message" \
    --subject "🚨 EC2 Monitoring Alert" \
    --region "$REGION"
}


if [ "$STATE" != "running" ]; then
  send_alert "❌ Instance $INSTANCE_ID is in '$STATE' state."
  exit 1
fi
