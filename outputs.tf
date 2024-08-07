output "gateway_api_id" {
  value = try(
    google_api_gateway_api.this.*.id
  )
}

output "gateway_api_api_id" {
  value = try(
    google_api_gateway_api.this.*.api_id
  )
}

output "gateway_api_name" {
  value = try(
    google_api_gateway_api.this.*.name
  )
}

output "gateway_api_labels" {
  value = try(
    google_api_gateway_api.this.*.labels
  )
}

output "gateway_api_config_name" {
  value = try(
    google_api_gateway_api_config.this.*.name
  )
}

output "gateway_api_config_id" {
  value = try(
    google_api_gateway_api_config.this.*.id
  )
}

output "gateway_api_config_api_config_id" {
  value = try(
    google_api_gateway_api_config.this.*.api_config_id
  )
}

output "gateway_api_config_api_config_id_prefix" {
  value = try(
    google_api_gateway_api_config.this.*.api_config_id_prefix
  )
}

output "gateway_gateway_id" {
  value = try(
    google_api_gateway_gateway.this.*.id
  )
}

output "gateway_gateway_gateway_id" {
  value = try(
    google_api_gateway_gateway.this.*.gateway_id
  )
}

output "gateway_gateway_api_config" {
  value = try(
    google_api_gateway_gateway.this.*.api_config
  )
}

