# Documentation

## Table of Contents

- [Modules](#modules)
  - [EKS](./EKS.md)
  - [Network subnets](./NETWORK_SUBNETS.md)
  - [Remote State](./REMOTE_STATE.md)
  - [Vpc](./VPC.md)
- [Platforms](#platforms)
- [Config](#config)


### Modules <a name="#modules"></a>

This directory is used to house all the modules used for the terraform scripts.  These modules can be used to create new platforms.  The platforms created within the platforms directory have used these modules and can extend the functionality of the current infrastructure.

### Platforms <a name="#platforms"></a>

This directory is used to house all the "environments" that can be created with the modules and configured with the configurations. The main "platform" will be the EKS platform that is composed of the components in the modules directory. Another platform to be made with the modules that will be in this directory will be the `remote_state`.

### Config <a name="#config"></a>

This directory is used to house all the configuration for the terraform scripts.  The `var-file` that you use to plan/apply the infrastructure lives here.  Each configuration is stored within the folder that specifies it's platform.  The remote state is also stored within the same context.

