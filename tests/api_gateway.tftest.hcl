run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "api_gateway_on_GCP" {
  command = [plan,apply]

  variables {
    project = "project-test"
    region  = "us-central1"
    api_gateway_api = [
      {
        id      = 0
        api_id  = "my-api-0"
      },
      {
        id      = 1
        api_id  = "my-api-1"
      }
    ]
    api_gateway_api_config = [
      {
        id            = 0
        api_id        = 0
        api_config_id = "my-config-1"
        openapi_documents = [
          {
            document = [
              {
                path = "spec.yaml"
                contents = filebase64("test-fixtures/openapi.yaml")
              }
            ]
          }
        ]
      },
      {
        id            = 1
        api_id        = 1
        api_config_id = "my-config-2"
        grpc_services = [
          {
            file_descriptor_set = [
              {
                path = "api_descriptor.pb"
                contents = "api_descriptor.pb"
              }
            ]
          }
        ]
      }
    ]
    api_gateway_gateway = [
      {
        id            = 0
        api_config_id = 0
        gateway_id    = "my-gateway-1"
      },
      {
        id            = 1
        api_config_id = 1
        gateway_id    = "my-gateway-2"
      }
    ]
    api_gateway_gateway_iam_binding = [
      {
        id          = 0
        gateway_id  = 0
        role        = "roles/apigateway.viewer"
        member      = "user:jane@example.com"
      }
    ]
    api_gateway_api_config_iam_member = [
      {
        id            = 0
        api_id        = 0
        api_config_id = 0
        role          = "roles/apigateway.viewer"
        member        = "user:jane@example.com"
      }
    ]
    api_gateway_api_iam_member = [
      {
        id      = 0
        api_id  = 0
        role    = "roles/apigateway.viewer"
        member  = "user:jane@example.com"
      }
    ]
  }
}