variable "project" {
  type        = string
  description = "The ID of the project in which the resource belongs"
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "api_gateway_api" {
  type = list(object({
    id              = number
    api_id          = string
    display_name    = optional(string)
    managed_service = optional(string)
    labels          = optional(map(string))
  }))
  default = []
}

variable "api_gateway_api_config" {
  type = list(object({
    id                   = number
    api_id               = any
    display_name         = optional(string)
    labels               = optional(map(string))
    api_config_id        = optional(string)
    api_config_id_prefix = optional(string)
    gateway_config = optional(list(object({
      backend_config = list(object({
        google_service_account = string
      }))
    })))
    grpc_services = optional(list(object({
      file_descriptor_set = list(object({
        path     = string
        contents = string
      }))
      source = optional(list(object({
        path     = string
        contents = string
      })))
    })))
    managed_service_configs = optional(list(object({
      path     = string
      contents = string
    })))
    openapi_documents = optional(list(object({
      document = list(object({
        path     = string
        contents = string
      }))
    })))
  }))
  default = []
}

variable "api_gateway_gateway" {
  type = list(object({
    id            = number
    api_config_id = any
    gateway_id    = string
    display_name  = optional(string)
    labels        = optional(map(string))
  }))
  default = []
}

variable "api_gateway_gateway_iam_binding" {
  type = list(object({
    id         = number
    gateway_id = any
    members    = list(string)
    role       = string
  }))
  default = []
}

variable "api_gateway_api_config_iam_member" {
  type = list(object({
    id            = number
    api_id        = any
    api_config_id = any
    member        = string
    role          = string
  }))
  default = []
}

variable "api_gateway_api_iam_member" {
  type = list(object({
    id     = number
    api_id = any
    member = string
    role   = string
  }))
  default = []
}

variable "region" {
  type        = string
  default     = null
  description = "Region of the gateway for the API"
}