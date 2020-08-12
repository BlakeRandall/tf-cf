variable "zone" {
  type = list(object({
    name       = string
    plan       = string
    type       = string
    paused     = bool
    jump_start = bool
  }))
  default = [
    {
      name       = "randall.family"
      plan       = "free"
      type       = "full"
      paused     = false
      jump_start = false
    },
    {
      name       = "theoneblk.xyz"
      plan       = "free"
      type       = "full"
      paused     = false
      jump_start = false
    }
  ]
}
