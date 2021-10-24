variable "ovirt_url" {
    description = "oVirt API URL"
    default = ""
}
variable "ovirt_username" {
    description = "oVirt Admin user"
    default     = ""
}
variable "ovirt_password" {
    description = "oVirt Admin password"
    default     = ""
}

variable dc_name {
  type        = string
  default     = ""
  description = "DataCenter name. ONLY DCs with state UP are allowed"
}

variable cl_name {
  type        = string
  default     = ""
  description = "Cluster name. The Storage Domain must exista on the cluster"
}

variable storagedomain_name {
  type        = string
  default     = ""
  description = "Instance storage domain"
}

variable tpl_name {
  type        = string
  default     = ""
  description = "Template to use for instance"
}

variable domain {
  type        = string
  default     = ""
  description = "Instance domain"
}

variable authorized_ssh_key_path {
  type        = string
  default     = ""
  description = "Path to ssh public key to be used ford authorization"
}


variable network_name {
  type        = string
  default     = "ovirtmgmt"
  description = "description"
}

# Provider
variable phpipam_url {
  type        = string
  default     = ""
  description = "description"
}

variable phpipam_app_id {
  type        = string
  default     = "iac"
  description = "description"
}

variable phpipam_username {
  type        = string
  default     = ""
  description = "description"
}

variable phpipam_password {
  type        = string
  default     = ""
  description = "description"
}

variable phpipam_insecure {
  type        = bool
  default     = false
  description = "description"
}

variable instances {
  type        = number
  default     = 1
  description = "description"
}

variable vm_os_type {
  type        = string
  default     = ""
  description = "description"
}

variable instance_name {
  type        = string
  default     = ""
  description = "description"
}

variable subnet_address {
  type        = string
  default     = ""
  description = "description"
}

variable subnet_mask {
  type        = string
  default     = ""
  description = "description"
}

variable nic_dev {
  type        = string
  default     = ""
  description = "description"
}
