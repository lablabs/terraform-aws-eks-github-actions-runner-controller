# AWS EKS <$addon-name> Terraform module

[![labyrinth labs logo](ll-logo.png)](https://lablabs.io/)

We help companies build, run, deploy and scale software and infrastructure by embracing the right technologies and principles. Check out our website at https://lablabs.io/

---

[![Terraform validate](https://github.com/lablabs/terraform-aws-eks-<$addon-name>/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-<$addon-name>/actions/workflows/validate.yaml)
[![pre-commit](https://github.com/lablabs/terraform-aws-<$addon-name>/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-<$addon-name>/actions/workflows/pre-commit.yml)

## Description

A terraform module to deploy the <$addon-name> on Amazon EKS cluster.

## Related Projects

Check out other [terraform kubernetes addons](https://github.com/orgs/lablabs/repositories?q=terraform-aws-eks&type=public&language=&sort=).

## Deployment methods

### Helm
Deploy helm chart by helm (default method, set `enabled = true`)

### Argo kubernetes
Deploy helm chart as argo application by kubernetes manifest (set `enabled = true` and `argo_enabled = true`)

### Argo helm
When deploying with ArgoCD application, Kubernetes terraform provider requires access to Kubernetes cluster API during plan time. This introduces potential issue when you want to deploy the cluster with this addon at the same time, during the same Terraform run.

To overcome this issue, the module deploys the ArgoCD application object using the Helm provider, which does not require API access during plan. If you want to deploy the application using this workaround, you can set the `argo_helm_enabled` variable to `true`.

Create helm release resource and deploy it as argo application (set `enabled = true`, `argo_enabled = true` and `argo_helm_enabled = true`)

<!-- Uncomment paragraph bellow if addon contains IAM resources
## AWS IAM resources

To disable of creation IRSA role and IRSA policy, set `irsa_role_create = false` and `irsa_policy_enabled = false`, respectively -->

<!-- Uncomment paragraph bellow if addon uses Role assuming
### Role assuming
To assume role set `irsa_assume_role_enabled = true` and specify `irsa_assume_role_arn` variable -->

## Examples

See [Basic example](examples/basic/README.md) for further information.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.19.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.6.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.11.0 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | >= 0.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| | |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| | | | | |

## Outputs

| Name | Description |
|------|-------------|
| | |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing and reporting issues

Feel free to create an issue in this repository if you have questions, suggestions or feature requests.

### Validation, linters and pull-requests

We want to provide high quality code and modules. For this reason we are using
several [pre-commit hooks](.pre-commit-config.yaml) and
[GitHub Actions workflows](.github/workflows/). A pull-request to the
main branch will trigger these validations and lints automatically. Please
check your code before you will create pull-requests. See
[pre-commit documentation](https://pre-commit.com/) and
[GitHub Actions documentation](https://docs.github.com/en/actions) for further
details.


## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
