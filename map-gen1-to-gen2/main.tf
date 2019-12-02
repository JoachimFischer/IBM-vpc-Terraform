# generation differences
variable generation {
  description = "1 or 2, 1 for vpc for classic 2 for vpc"
  type        = "string"
}

# image
variable image {
  description = "generation 1 name of the image"
  type        = "string"
}

variable image_map {
  default = {
    "windows-2016-amd64"    = "ibm-windows-2016-full-std-64"
    "ubuntu-16.04-amd64"    = "ibm-ubuntu-16-04-05-64-minimal-for-vsi"
    "windows-2012-r2-amd64" = "ibm-windows-2012-r2-full-std-64"
    "windows-2012-amd64"    = "ibm-windows-2012-full-std-64"
    "centos-7.x-amd64"      = "ibm-centos-7-0-64"
    "ubuntu-18.04-amd64"    = "ibm-ubuntu-18-04-64"
    "debian-9.x-amd64"      = "ibm-debian-9-0-64-minimal-for-vsi"
  }
}

output image {
  value = "${var.generation == 2 ? var.image_map[var.image] : var.image}"
}

variable profile {
  description = "generation 1 name of the profile"
  type        = "string"
}

variable profile_map {
  default = {
    "bc1-16x64"  = "bx2-16x64"
    "bc1-2x8"    = "bx2-2x8"
    "bc1-32x128" = "bx2-32x128"
    "bc1-48x192" = "bx2-48x192"
    "bc1-4x16"   = "bx2-4x16"
    "bc1-8x32"   = "bx2-8x32"
    "cc1-16x32"  = "cx2-16x32"
    "cc1-2x4"    = "cx2-2x4"
    "cc1-32x64"  = "cx2-32x64"
    "cc1-4x8"    = "cx2-4x8"
    "cc1-8x16"   = "cx2-8x16"
    "mc1-16x128" = "mx2-16x128"
    "mc1-2x16"   = "mx2-2x16"
    "mc1-32x256" = "mx2-32x256"
    "mc1-4x32"   = "mx2-4x32"
    "mc1-8x64"   = "mx2-8x64"
  }
}

# 
output profile {
  value = "${var.generation == 2 ? var.profile_map[var.profile] : var.profile}"
}
