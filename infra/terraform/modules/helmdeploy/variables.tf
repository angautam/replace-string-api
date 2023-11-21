variable "app_version" {
  type        = string
  description = "this is the version number of the app build - String"
  default     = "0.1.0"
}

variable "ingress_hosts" {
  default = null
}