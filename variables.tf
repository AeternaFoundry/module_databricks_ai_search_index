variable "ai_search_indices" {
  description = <<EOT
Map of ai_search_indices, attributes below
Required:
    - index_type
    - parent
    - primary_key
Optional:
    - delta_sync_index_spec
    - direct_access_index_spec
    - index_id
    - index_subtype
    - provider_config
EOT

  type = map(object({
    index_type  = string
    parent      = string
    primary_key = string
    delta_sync_index_spec = optional(object({
      columns_to_sync = optional(list(string))
      embedding_source_columns = optional(list(object({
        embedding_model_endpoint      = optional(string)
        model_endpoint_name_for_query = optional(string)
        name                          = optional(string)
      })))
      embedding_vector_columns = optional(list(object({
        embedding_dimension = optional(number)
        name                = optional(string)
      })))
      embedding_writeback_table = optional(string)
      pipeline_type             = string
      source_table              = optional(string)
    }))
    direct_access_index_spec = optional(object({
      embedding_source_columns = optional(list(object({
        embedding_model_endpoint      = optional(string)
        model_endpoint_name_for_query = optional(string)
        name                          = optional(string)
      })))
      embedding_vector_columns = optional(list(object({
        embedding_dimension = optional(number)
        name                = optional(string)
      })))
      schema_json = optional(string)
    }))
    index_id      = optional(string)
    index_subtype = optional(string)
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
  }))
}

