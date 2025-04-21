output "sns_topic_arn" {
  description = "SNS topic ARN for EC2 alerts"
  value       = aws_sns_topic.ec2_alerts.arn
}
