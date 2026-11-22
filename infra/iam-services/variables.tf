variable "region" {
  description = "Région AWS du projet"
  type        = string
  default     = "eu-west-3"
}

variable "prefix" {
  description = "Préfixe des ressources AWS"
  type        = string
  default     = "pfs-"
}

variable "budget_limit" {
  description = "Montant mensuel du budget, en dollars"
  type        = number
  default     = 5
}

variable "alert_email" {
  description = "Adresse qui reçoit les alertes de budget"
  type        = string
}
