resource "google_monitoring_alert_policy" "alert_policy" {
display_name = "My Alert Policy"
  combiner     = "OR"
  conditions {
    display_name = "test condition"
    condition_threshold {
      filter     = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
      duration   = "60s"
      comparison = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_RATE"
      }
    }
  }

  user_labels = {
    foo = "bar"
  }


  conditions {
    display_name = "test condition"
    condition_threshold {
    filter     = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\""
    duration   = "180s"
    comparison = "COMPARISON_GT"
    threshold_value = 0.2
   aggregations {
       alignment_period = "180s"
        per_series_aligner = "ALIGN_SUM"
        cross_series_reducer = "REDUCE_SUM"
    }
    trigger {
        count =1
    }
    }
  }
}
