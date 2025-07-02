variable "vpc_config" {
  description = "To get CIDR and Name of VPC from user"
  type = object({
    cidr_block = string
    name       = string
  })
  
  validation {                                                     #vpc validation
        condition =can(cidrnetmask(var.vpc_config.cidr_block))   #10.0.00/24
      error_message = "Invalid CIDR Formate - ${var.vpc_config.cidr_block}"
}
}

variable "subnet_config" {
  #sub1={cidr=.. az=..}  sub2={}  sub3={}
  description = "get the CIDR & AZ for the subnets"
  type = map(object({
    cidr_block = string
    az         = string
    public = optional(bool, false)
  }))

  validation {      #subnet validation
          
    #sub1={cidr=} sub2={cidr=..}, [true, true, false]
    condition = alltrue([for config in var.subnet_config: can(cidrnetmask(config.cidr_block))])
    error_message = "Invalid CIDR Formate "
  }
}
