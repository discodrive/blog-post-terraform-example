variable "app_name" {
  description = "Name of the Heroku app provisioned (lowercase letters and hyphens only)"
  validation {
    # regex(...) will fail if it cannot find a match
    # lowercase letters and hyphens only
    condition     = can(regex("^[a-z]+(-[a-z]+)*$", var.app_name))
    error_message = "The app name may only contain lowercase letters and hyphens."
  }
}
variable "app_region" {
  description = "Region the app is provisioned in"
  default     = "Europe"
}

variable "database_username" {
  description = "Database username"
}
variable "database_password" {
  description = "Database password (Min length 8 characters)"
  validation {
    # regex(...) will fail if it cannot find a match
    # Minimum 8 characters including upper/lower case letters, numbers and punctuation [!"#$%&'()*+,\-./:;<=>?@[\]^_`{|}~]
    condition     = can(regex("^[a-zA-Z0-9[:punct:]]{8,}$", var.database_password))
    error_message = "The database password must contain at least 8 characters."
  }
}
