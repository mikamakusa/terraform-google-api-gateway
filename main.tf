resource "google_api_gateway_api" "this" {
  count           = length(var.api_gateway_api)
  provider        = google-beta
  api_id          = lookup(var.api_gateway_api[count.index], "api_id")
  display_name    = lookup(var.api_gateway_api[count.index], "display_name")
  managed_service = lookup(var.api_gateway_api[count.index], "managed_service")
  labels = merge(
    var.labels,
    lookup(var.api_gateway_api[count.index], "labels")
  )
  project = data.google_project.this.id
}

resource "google_api_gateway_api_config" "this" {
  count    = length(var.api_gateway_api) == 0 ? 0 : length(var.api_gateway_api_config)
  provider = google-beta
  api = try(
    element(google_api_gateway_api.this.*.api_id, lookup(var.api_gateway_api_config[count.index], "api_id"))
  )
  display_name = lookup(var.api_gateway_api_config[count.index], "display_name")
  project      = data.google_project.this.id
  labels = merge(
    var.labels,
    lookup(var.api_gateway_api_config[count.index], "labels")
  )
  api_config_id        = lookup(var.api_gateway_api_config[count.index], "api_config_id")
  api_config_id_prefix = lookup(var.api_gateway_api_config[count.index], "api_config_id_prefix")

  dynamic "gateway_config" {
    for_each = lookup(var.api_gateway_api_config[count.index], "gateway_config") == null ? [] : ["gateway_config"]
    content {
      dynamic "backend_config" {
        for_each = lookup(gateway_config.value, "backend_config") == null ? [] : ["backend_config"]
        content {
          google_service_account = lookup(backend_config.value, "google_service_account")
        }
      }
    }
  }

  dynamic "grpc_services" {
    for_each = lookup(var.api_gateway_api_config[count.index], "grpc_services") == null ? [] : ["grpc_services"]
    content {
      dynamic "file_descriptor_set" {
        for_each = lookup(grpc_services.value, "file_descriptor_set") == null ? [] : ["file_descriptor_set"]
        content {
          path     = lookup(file_descriptor_set.value, "path")
          contents = filebase64(join("/", [path.cwd, "grpc-file", lookup(file_descriptor_set.value, "contents")]))
        }
      }
      dynamic "source" {
        for_each = lookup(grpc_services.value, "source") == null ? [] : ["source"]
        content {
          path     = lookup(source.value, "path")
          contents = filebase64(join("/", [path.cwd, "grpc-file", lookup(source.value, "contents")]))
        }
      }
    }
  }

  dynamic "managed_service_configs" {
    for_each = lookup(var.api_gateway_api_config[count.index], "managed_service_configs") == null ? [] : ["managed_service_configs"]
    content {
      path     = lookup(managed_service_configs.value, "path")
      contents = filebase64(join("/", [path.cwd, "config", lookup(managed_service_configs.value, "contents")]))
    }
  }

  dynamic "openapi_documents" {
    for_each = lookup(var.api_gateway_api_config[count.index], "openapi_documents") == null ? [] : ["openapi_documents"]
    content {
      dynamic "document" {
        for_each = lookup(openapi_documents.value, "document") == null ? [] : ["document"]
        content {
          path     = lookup(document.value, "path")
          contents = filebase64(join("/", [path.cwd, "openapi-documents", lookup(document.value, "contents")]))
        }
      }
    }
  }
}

resource "google_api_gateway_gateway" "this" {
  count    = length(var.api_gateway_api_config) == 0 ? 0 : length(var.api_gateway_gateway)
  provider = google-beta
  api_config = try(
    element(google_api_gateway_api_config.this.*.id, lookup(var.api_gateway_gateway[count.index], "api_config_id"))
  )
  gateway_id   = lookup(var.api_gateway_gateway[count.index], "gateway_id")
  display_name = lookup(var.api_gateway_gateway[count.index], "display_name")
  labels = merge(
    var.labels,
    lookup(var.api_gateway_gateway[count.index], "labels")
  )
  region  = var.region
  project = data.google_project.this.id
}

resource "google_api_gateway_gateway_iam_binding" "this" {
  count    = length(var.api_gateway_gateway) == 0 ? 0 : length(var.api_gateway_gateway_iam_binding)
  provider = google-beta
  region   = try(element(google_api_gateway_gateway.this.*.region, lookup(var.api_gateway_gateway_iam_binding[count.index], "gateway_id")))
  project  = try(element(google_api_gateway_gateway.this.*.project, lookup(var.api_gateway_gateway_iam_binding[count.index], "gateway_id")))
  gateway  = try(element(google_api_gateway_gateway.this.*.gateway_id, lookup(var.api_gateway_gateway_iam_binding[count.index], "gateway_id")))
  members  = lookup(var.api_gateway_gateway_iam_binding[count.index], "members")
  role     = lookup(var.api_gateway_gateway_iam_binding[count.index], "role")
}

resource "google_api_gateway_api_config_iam_member" "this" {
  count      = (length(var.api_gateway_api) && length(var.api_gateway_api_config)) == 0 ? 0 : length(var.api_gateway_api_config_iam_member)
  provider   = google-beta
  project    = try(element(google_api_gateway_api_config.this.*.project, lookup(var.api_gateway_api_config_iam_member[count.index], "api_id")))
  api        = try(element(google_api_gateway_api_config.this.*.api, lookup(var.api_gateway_api_config_iam_member[count.index], "api_id")))
  api_config = try(element(google_api_gateway_api_config.this.*.api_config_id, lookup(var.api_gateway_api_config_iam_member[count.index], "api_config_id")))
  member     = lookup(var.api_gateway_gateway_iam_binding[count.index], "member")
  role       = lookup(var.api_gateway_gateway_iam_binding[count.index], "role")
}

resource "google_api_gateway_api_iam_member" "this" {
  count    = length(var.api_gateway_api) == 0 ? 0 : length(var.api_gateway_api_iam_member)
  provider = google-beta
  project  = try(element(google_api_gateway_api.this.*.project, lookup(var.api_gateway_api_iam_member[count.index], "api_id")))
  api      = try(element(google_api_gateway_api.this.*.api_id, lookup(var.api_gateway_api_iam_member[count.index], "api_id")))
  member   = lookup(var.api_gateway_api_iam_member[count.index], "member")
  role     = lookup(var.api_gateway_api_iam_member[count.index], "role")
}