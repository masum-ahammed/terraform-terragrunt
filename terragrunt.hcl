terraform {
  extra_arguments "common_vars" {
    commands = get_terraform_commands_that_need_vars()
    env_vars = {
      AWS_DEFAULT_REGION = "us-east-1"
    }
  }
}