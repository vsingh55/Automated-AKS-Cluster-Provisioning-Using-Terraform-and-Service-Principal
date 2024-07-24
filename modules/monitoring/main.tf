# Creating log analytics workspace to store logs
resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"

  retention_in_days = 30
}

# Configuring AKS monitoring diagnostic settings
resource "azurerm_monitor_diagnostic_setting" "aks_monitoring" {
  name               = "aks-monitoring"
  target_resource_id = var.aks_cluster_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id

  log {
    category = "kube-apiserver"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "kube-audit"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "kube-controller-manager"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "kube-scheduler"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }

  log {
    category = "cluster-autoscaler"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }
}
