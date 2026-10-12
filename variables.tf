variable "tables" {
  description = <<EOT
Map of tables, attributes below
Required:
    - database
    - name
    - schema
    - column (block):
        - collate (optional)
        - comment (optional)
        - default (optional, block):
            - constant (optional)
            - expression (optional)
            - sequence (optional)
        - identity (optional, block):
            - start_num (optional)
            - step_num (optional)
        - masking_policy (optional)
        - name (required)
        - nullable (optional)
        - type (required)
Optional:
    - change_tracking
    - cluster_by
    - comment
    - data_retention_time_in_days
    - primary_key (block):
        - keys (required)
        - name (optional)
    - tag (block):
        - database (optional)
        - name (required)
        - schema (optional)
        - value (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    database                    = string
    name                        = string
    schema                      = string
    change_tracking             = optional(bool)
    cluster_by                  = optional(list(string))
    comment                     = optional(string)
    data_retention_time_in_days = optional(number)
    column = list(object({
      collate = optional(string)
      comment = optional(string)
      default = optional(object({
        constant   = optional(string)
        expression = optional(string)
        sequence   = optional(string)
      }))
      identity = optional(object({
        start_num = optional(number)
        step_num  = optional(number)
      }))
      masking_policy = optional(string)
      name           = string
      nullable       = optional(bool)
      type           = string
    }))
    primary_key = optional(object({
      keys = list(string)
      name = optional(string)
    }))
    tag = optional(list(object({
      database = optional(string)
      name     = string
      schema   = optional(string)
      value    = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.tables : (
        length(v.column) >= 1
      )
    ])
    error_message = "Each column list must contain at least 1 items"
  }
}

