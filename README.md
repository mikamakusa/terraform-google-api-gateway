## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 5.40.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 5.40.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_api_gateway_api.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_api_gateway_api) | resource |
| [google-beta_google_api_gateway_api_config.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_api_gateway_api_config) | resource |
| [google-beta_google_api_gateway_api_config_iam_member.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_api_gateway_api_config_iam_member) | resource |
| [google-beta_google_api_gateway_api_iam_member.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_api_gateway_api_iam_member) | resource |
| [google-beta_google_api_gateway_gateway.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_api_gateway_gateway) | resource |
| [google-beta_google_api_gateway_gateway_iam_binding.this](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_api_gateway_gateway_iam_binding) | resource |
| [google_project.this](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_gateway_api"></a> [api\_gateway\_api](#input\_api\_gateway\_api) | n/a | <pre>list(object({<br>    id              = number<br>    api_id          = string<br>    display_name    = optional(string)<br>    managed_service = optional(string)<br>    labels          = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_api_gateway_api_config"></a> [api\_gateway\_api\_config](#input\_api\_gateway\_api\_config) | n/a | <pre>list(object({<br>    id                   = number<br>    api_id               = any<br>    display_name         = optional(string)<br>    labels               = optional(map(string))<br>    api_config_id        = optional(string)<br>    api_config_id_prefix = optional(string)<br>    gateway_config = optional(list(object({<br>      backend_config = list(object({<br>        google_service_account = string<br>      }))<br>    })))<br>    grpc_services = optional(list(object({<br>      file_descriptor_set = list(object({<br>        path     = string<br>        contents = string<br>      }))<br>      source = optional(list(object({<br>        path     = string<br>        contents = string<br>      })))<br>    })))<br>    managed_service_configs = optional(list(object({<br>      path     = string<br>      contents = string<br>    })))<br>    openapi_documents = optional(list(object({<br>      document = list(object({<br>        path     = string<br>        contents = string<br>      }))<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_api_gateway_api_config_iam_member"></a> [api\_gateway\_api\_config\_iam\_member](#input\_api\_gateway\_api\_config\_iam\_member) | n/a | <pre>list(object({<br>    id            = number<br>    api_id        = any<br>    api_config_id = any<br>    member        = string<br>    role          = string<br>  }))</pre> | `[]` | no |
| <a name="input_api_gateway_api_iam_member"></a> [api\_gateway\_api\_iam\_member](#input\_api\_gateway\_api\_iam\_member) | n/a | <pre>list(object({<br>    id     = number<br>    api_id = any<br>    member = string<br>    role   = string<br>  }))</pre> | `[]` | no |
| <a name="input_api_gateway_gateway"></a> [api\_gateway\_gateway](#input\_api\_gateway\_gateway) | n/a | <pre>list(object({<br>    id            = number<br>    api_config_id = any<br>    gateway_id    = string<br>    display_name  = optional(string)<br>    labels        = optional(map(string))<br>  }))</pre> | `[]` | no |
| <a name="input_api_gateway_gateway_iam_binding"></a> [api\_gateway\_gateway\_iam\_binding](#input\_api\_gateway\_gateway\_iam\_binding) | n/a | <pre>list(object({<br>    id         = number<br>    gateway_id = any<br>    members    = list(string)<br>    role       = string<br>  }))</pre> | `[]` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | n/a | `map(string)` | `{}` | no |
| <a name="input_project"></a> [project](#input\_project) | The ID of the project in which the resource belongs | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region of the gateway for the API | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gateway_api_api_id"></a> [gateway\_api\_api\_id](#output\_gateway\_api\_api\_id) | n/a |
| <a name="output_gateway_api_config_api_config_id"></a> [gateway\_api\_config\_api\_config\_id](#output\_gateway\_api\_config\_api\_config\_id) | n/a |
| <a name="output_gateway_api_config_api_config_id_prefix"></a> [gateway\_api\_config\_api\_config\_id\_prefix](#output\_gateway\_api\_config\_api\_config\_id\_prefix) | n/a |
| <a name="output_gateway_api_config_id"></a> [gateway\_api\_config\_id](#output\_gateway\_api\_config\_id) | n/a |
| <a name="output_gateway_api_config_name"></a> [gateway\_api\_config\_name](#output\_gateway\_api\_config\_name) | n/a |
| <a name="output_gateway_api_id"></a> [gateway\_api\_id](#output\_gateway\_api\_id) | n/a |
| <a name="output_gateway_api_labels"></a> [gateway\_api\_labels](#output\_gateway\_api\_labels) | n/a |
| <a name="output_gateway_api_name"></a> [gateway\_api\_name](#output\_gateway\_api\_name) | n/a |
| <a name="output_gateway_gateway_api_config"></a> [gateway\_gateway\_api\_config](#output\_gateway\_gateway\_api\_config) | n/a |
| <a name="output_gateway_gateway_gateway_id"></a> [gateway\_gateway\_gateway\_id](#output\_gateway\_gateway\_gateway\_id) | n/a |
| <a name="output_gateway_gateway_id"></a> [gateway\_gateway\_id](#output\_gateway\_gateway\_id) | n/a |
