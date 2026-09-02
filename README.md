AWS EKS Infrastructure with Terraform
Modular Terraform configuration to provision a production-ready Amazon EKS cluster along with a dedicated multi-AZ VPC, IAM roles, and secure remote state management. Includes automated CI validation via GitHub Actions.

Architecture Overview
Remote State Backend (bootstrap/):

S3 bucket with versioning and AES256 server-side encryption.

DynamoDB table (PAY_PER_REQUEST) for state locking.

Network Module (modules/network/):

VPC spanning 2 Availability Zones.

2 Public Subnets with Internet Gateway and ALB discovery tags (kubernetes.io/role/elb = 1).

2 Private Subnets with single NAT Gateway and internal load balancer tags (kubernetes.io/role/internal-elb = 1).

Public and private route tables with subnet associations.

EKS Module (modules/eks/):

EKS Cluster running Kubernetes v1.30 with API access mode.

Dedicated IAM Role with AmazonEKSClusterPolicy.

EKS Managed Node Group (t3.small instances) hosted strictly in private subnets.

Worker node IAM Role configured with AmazonEKSWorkerNodePolicy, AmazonEKS_CNI_Policy, and AmazonEC2ContainerRegistryReadOnly.

OIDC provider URL exported for IRSA (IAM Roles for Service Accounts).

.
├── bootstrap/               # One-time setup for S3 bucket & DynamoDB lock table
│   └── main.tf
├── modules/
│   ├── network/             # Custom VPC, Subnets, IGW, NAT GW, Route Tables
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── eks/                 # EKS Control Plane, Managed Node Group & IAM Roles
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   └── dev/                 # Dev root module orchestrating network & eks
│       ├── main.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│       ├── versions.tf
│       └── outputs.tf
├── .github/
│   └── workflows/
│       └── terraform-ci.yml # GitHub Actions workflow for linting & validation
└── README.md

Continuous Integration
GitHub Actions workflow triggers on push and pull requests to main:

Checks formatting (terraform fmt -check -recursive).

Initializes configuration without cloud backend dependencies (terraform init -backend=false).

Validates HCL syntax and module inputs (terraform validate).