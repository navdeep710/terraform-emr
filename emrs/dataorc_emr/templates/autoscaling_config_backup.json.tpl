{
  "Constraints": {
    "MinCapacity": 1,
    "MaxCapacity": 3
  },
  "Rules": [
    {
      "Name": "ScaleOutMemoryPercentage",
      "Description": "Scale out if YARNMemoryAvailablePercentage is less than 15",
      "Action": {
        "SimpleScalingPolicyConfiguration": {
          "AdjustmentType": "CHANGE_IN_CAPACITY",
          "ScalingAdjustment": 1,
          "CoolDown": 100
        }
      },
      "Trigger": {
        "CloudWatchAlarmDefinition": {
          "ComparisonOperator": "LESS_THAN",
          "EvaluationPeriods": 1,
          "MetricName": "YARNMemoryAvailablePercentage",
          "Namespace": "AWS/ElasticMapReduce",
          "Period": 300,
          "Statistic": "AVERAGE",
          "Threshold": 15.0,
          "Unit": "PERCENT"
        }
      }
    }
,
    {
    "Name": "ScaleInMemoryPercentage",
    "Description": "Scale in if YARNMemoryAvailablePercentage is greter than 50",
    "Action": {
    "SimpleScalingPolicyConfiguration": {
    "AdjustmentType": "CHANGE_IN_CAPACITY",
    "ScalingAdjustment": -1,
    "CoolDown": 300
    }
    },
    "Trigger": {
    "CloudWatchAlarmDefinition": {
    "ComparisonOperator": "GREATER_THAN_OR_EQUAL",
    "EvaluationPeriods": 1,
    "MetricName": "YARNMemoryAvailablePercentage",
    "Namespace": "AWS/ElasticMapReduce",
    "Period": 600,
    "Statistic": "AVERAGE",
    "Threshold": 60.0,
    "Unit": "PERCENT"
    }
    }
}

  ]
}