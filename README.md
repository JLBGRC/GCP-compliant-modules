Markdown
# GCP Compliant Infrastructure Modules

A production-grade, secure, and reusable Terraform module library for Google Cloud Platform (GCP), adhering to enterprise security best practices and compliance frameworks.

## Repository Architecture

This repository follows a clean modular pattern separating core reusable logic from environment-specific consumer implementations and compliance validation evidence:

```text
C:.
├── .gitignore
├── README.md
├── modules
│   └── compliant-gcs-bucket        # Reusable core Terraform module
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
└── consumers
    ├── dev                         # Development environment consumer
    │   ├── main.tf
    │   └── kms-compliance-verification.yaml # Audit evidence artifact
    ├── prod                        # Production environment consumer
    │   └── main.tf
    └── negative-test               # Security guardrail validation test
        ├── main.tf
        └── bucket-compliance-verification.yaml # Negative test evidence

Core Module: compliant-gcs-bucket
The compliant-gcs-bucket module enforces mandatory cloud security controls out-of-the-box:

Uniform Bucket-Level Access: Prevents granular ACL misconfigurations.

Public Access Prevention (PAP): Hard-blocks accidental public exposure.

Customer-Managed Encryption Keys (CMEK): Integrates Cloud KMS with automated 90-day rotation schedules.

Object Versioning & Retention: Protects against accidental deletion or modification with configurable retention policies.

Usage Example
To consume the module in your own environment configuration (consumers/dev/main.tf):

Terraform
module "secure_bucket" {
  source = "../../modules/compliant-gcs-bucket"

  project_id  = "your-gcp-project-id"
  region      = "us-central1"
  environment = "dev"
  app_name    = "my-secure-app"
}
✅ Audit & Compliance Verification
To prove that the infrastructure successfully adheres to security baselines, automated verification outputs and gcloud assertions are captured as auditable YAML evidence artifacts directly in the repository:

KMS Rotation Verification: See consumers/dev/kms-compliance-verification.yaml

Bucket Security Guardrails: See consumers/negative-test/bucket-compliance-verification.yaml
