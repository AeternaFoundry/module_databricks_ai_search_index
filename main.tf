resource "databricks_ai_search_index" "ai_search_indices" {
  for_each = var.ai_search_indices

  index_type               = each.value.index_type
  parent                   = each.value.parent
  primary_key              = each.value.primary_key
  delta_sync_index_spec    = each.value.delta_sync_index_spec
  direct_access_index_spec = each.value.direct_access_index_spec
  index_id                 = each.value.index_id
  index_subtype            = each.value.index_subtype
  provider_config          = each.value.provider_config
}

